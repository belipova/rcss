using Microsoft.EntityFrameworkCore;
using MySqlConnector;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using Newtonsoft.Json;
using Microsoft.EntityFrameworkCore.ChangeTracking;

namespace WpfRcss
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private RcssDbContext _dbContext;
        private string _selectedTableName;
        private List<ErrorMessage> _errors = new List<ErrorMessage>();
        public MainWindow()
        {
            try
            {
                InitializeComponent();

                _dbContext = new RcssDbContext();
                tableList.ItemsSource = _dbContext.GetTableNames();
            }
            catch (Exception exception)
            {
                _errors.Add(new ErrorMessage()
                {
                    Message = exception.Message,
                    StackTrace = exception.StackTrace
                });
            }
        }
        
        private void TableDataGridOnRowEditEnding(object? sender, DataGridRowEditEndingEventArgs e)
        {
            Action action = delegate
            {
                try
                {
                    var ind = e.Row.GetIndex();
                    var g = (e.Row.Item as DataRowView).DataView.Table;
                    var currentType = _dbContext.GetTypeByName(_selectedTableName).GenericTypeArguments.First();
                    var list = JsonConvert.DeserializeObject(JsonConvert.SerializeObject(g, Formatting.None, new JsonSerializerSettings()
                    {
                        NullValueHandling = NullValueHandling.Ignore
                    }), typeof(List<>).MakeGenericType(new[] { currentType })) as IList;
                    var item = list[ind];
                    try
                    {
                        _dbContext.Update(item);
                        _dbContext.SaveChanges();
                    }
                    catch (Exception exception)
                    {
                        _dbContext.ChangeTracker.Clear();
                        _errors.Add(new ErrorMessage()
                        {
                            Message = exception.Message + ' ' + exception.InnerException?.Message,
                            StackTrace = exception.StackTrace
                        });
                        throw;
                    }
                }
                catch (Exception exception)
                {
                    _errors.Add(new ErrorMessage()
                    {
                        Message = exception.Message + ' ' + exception.InnerException?.Message,
                        StackTrace = exception.StackTrace
                    });
                }
                finally
                {
                    Refresh(_selectedTableName);
                }
            };
            Dispatcher.BeginInvoke(action, System.Windows.Threading.DispatcherPriority.Background);
        }

        private void ButtonBase_OnClick(object sender, RoutedEventArgs e)
        {
            try
            {
                _selectedTableName = (sender as Button).Content.ToString();
                Refresh(_selectedTableName);
            }
            catch (Exception exception)
            {
                _errors.Add(new ErrorMessage()
                {
                    Message = exception.Message + ' ' + exception.InnerException?.Message,
                    StackTrace = exception.StackTrace
                });
            }
        }

        private void Refresh(string name)
        {
            using (var connection = new MySqlConnection(_dbContext.Database.GetConnectionString()))
            {
                connection.Open();

                string query = $"SELECT * FROM {name}";
                using (var command = new MySqlCommand(query, connection))
                {
                    using (var adapter = new MySqlDataAdapter(command))
                    {
                        var dataTable = new DataTable();
                        adapter.Fill(dataTable);
                        tableDataGrid.ItemsSource = dataTable.DefaultView;
                    }
                }
            }
        }

        private void ButtonErrors_OnClick(object sender, RoutedEventArgs e)
        {
            tableDataGrid.ItemsSource = _errors;
        }
    }
}
