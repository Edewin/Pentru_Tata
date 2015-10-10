using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Windows.Forms;

namespace loginPage
{
    public class MySQL_Class
    {
        private static string connStringSQL = "Server=localhost; Port=3306; Database=membri; Uid=root1; Pwd=root;";
        private MySqlConnection conn;
        private MySqlCommand command;

        public void openMySQL()
        {
            try
            {
                conn = new MySqlConnection(connStringSQL);
                conn.Open();
            }
            catch (MySqlException ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public void closeMySQL()
        {
            try
            {
                conn.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public MySqlCommand ExecuteQuerry(string querry, MySqlConnection connection)
        {
            try
            {
                command = new MySqlCommand(querry, connection);
                return command;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return null;
            }
        }

        public MySqlConnection GetConnection()
        {
            if (conn.State == System.Data.ConnectionState.Open)
            {
                return conn;
            }
            else
            {
                return null;
            }
        }
    }
}
