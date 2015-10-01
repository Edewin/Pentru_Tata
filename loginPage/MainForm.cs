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

namespace loginPage
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();            
        }

        MySQL_Class sql = new MySQL_Class();
        MySqlConnection conn;
        MySqlDataAdapter adapter;
        MySqlDataAdapter adap2;
        MySqlCommandBuilder cmdbl, cmd2;
        DataSet ds, ds2;

        private void MainForm_Load(object sender, EventArgs e)
        {
            try 
	        {
                sql.openMySQL();
                conn = sql.GetConnection();
                adapter = new MySqlDataAdapter("SELECT * FROM test.persoane;", conn);
                adap2 = new MySqlDataAdapter("SELECT persoane.nume AS Nume, persoane.prenume AS Prenume, persoane.data_nasterii AS Data_nasterii FROM test.persoane ORDER BY Nume;", conn);
                ds = new DataSet();
                ds2 = new DataSet();
                adapter.Fill(ds, "Person_details");
                adap2.Fill(ds2, "List_of_Persons");
                dataGridView1.DataSource = ds.Tables[0];
                listBox1.DataSource = ds2.Tables["List_of_Persons"];
                listBox1.DisplayMember = "Nume";
	        }
	        catch (Exception ex)
	        {
		
		        MessageBox.Show(ex.Message);
	        }
        }
        private void buttonInsert_Click(object sender, EventArgs e)
        {
            try
            {
                cmdbl = new MySqlCommandBuilder(adapter);
                cmd2 = new MySqlCommandBuilder(adap2);
                dataGridView1.DataSource = null;
                dataGridView1.Rows.Clear();
                adapter.Update(ds, "Person_details");
                
              //  adapter.Fill(ds, "Person_details");
                dataGridView1.DataSource = ds.Tables[0];

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void listBox1_Click(object sender, EventArgs e)
        {
            MessageBox.Show(listBox1.DisplayMember);
        }


    }
}
