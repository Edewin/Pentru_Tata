using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using System.Threading;


namespace loginPage
{
    public partial class Form1 : Form
    {
        Thread th;
        public Form1()
        {
            InitializeComponent();
        }

        MySQL_Class sql = new MySQL_Class();
        
        private void buttonLogin_Click(object sender, EventArgs e)
        {

            sql.openMySQL();
            MySqlCommand select_command;
            select_command = sql.ExecuteQuerry("SELECT * FROM membri.users WHERE user_name='"
                                              + textBoxUserName.Text + "' AND user_password='"
                                              + textBoxPassword.Text.GetHashCode().ToString() + "';", sql.GetConnection());

            
            MySqlDataReader myReader;

            try
            {
                myReader = select_command.ExecuteReader();

                int count = 0;
                while (myReader.Read())
                {
                    count++;
                }
                if (count == 1)
                {
                    // MessageBox.Show("you`re in");
                    //hide this form, open the new one
                    this.Hide();
                    
                    th = new Thread(openNewForm);
                    this.Close();
                    th.SetApartmentState(ApartmentState.STA);
                    th.Start();

                }
                else
                    MessageBox.Show("wrong username or password");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            sql.closeMySQL();



        }

        private void openNewForm(object obj)
        {
            Application.Run(new MainForm());
        }

        private void button1_Click(object sender, EventArgs e)
        {
           // textBox1.Text = textBoxPassword.Text.GetHashCode().ToString();
        }
    }

       
}
