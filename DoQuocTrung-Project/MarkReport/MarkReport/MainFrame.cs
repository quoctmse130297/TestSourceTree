using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;

namespace MarkReport
{
    public partial class MainFrame : Form
    {
        MyConnection myConn = new MyConnection();
        SqlConnection conn;
        SqlCommand cmd;
        SqlDataAdapter da;

        public void ShowCombobox()
        {
            conn = myConn.GetConn();
            conn.Open();
            cmd = new SqlCommand("SELECT * FROM tblStudent", conn);
            da = new SqlDataAdapter();
            da.SelectCommand = cmd;

            DataTable table = new DataTable();
            da.Fill(table);
            cbbCode.DataSource = table;
            cbbCode.DisplayMember = "code";
            cbbCode.ValueMember = "code";
        }


        public MainFrame()
        {
            InitializeComponent();
            Init();
        }

        private void LoadDgv(String studentCode)
        {
            MyConnection.OpenDB();
            String sql = "SELECT  tblMark.courseCode ,\n"
            + "        tblCourse.name ,\n"
            + "        tblMark.avgMark\n"
            + "FROM    ( SELECT    courseCode ,\n"
            + "                    AVG(tblMarkReport.mark) AS avgMark\n"
            + "          FROM      dbo.tblMarkReport\n"
            + "          WHERE     studentCode = '"+ studentCode + "'\n"
            + "          GROUP BY  tblMarkReport.courseCode\n"
            + "        ) AS tblMark\n"
            + "        JOIN dbo.tblCourse ON dbo.tblCourse.code = tblMark.courseCode;";
            dgvMark.DataSource = MyConnection.GetDataTable(sql);
        }

        public void loadStudentInfo(String studentCode)
        {
            MyConnection.OpenDB();
            //String sql = "SELECT  tblMark.courseCode ,\n"
            //+ "        tblCourse.name ,\n"
            //+ "        tblMark.avgMark ,\n"
            //+ "        tblStudent.firstName ,\n "
            //+ "        tblStudent.lastName ,\n "
            //+ "        tblStudent.DateOfBirth ,\n "
            //+ "        tblStudent.sex ,\n "
            //+ "        tblStudent.classCode ,\n "
            //+ "FROM    ( SELECT    courseCode ,\n"
            //+ "                    AVG(tblMarkReport.mark) AS avgMark\n"
            //+ "          FROM      dbo.tblMarkReport\n"
            //+ "          WHERE     studentCode = '" + studentCode + "'\n"
            //+ "          GROUP BY  tblMarkReport.courseCode\n"
            //+ "        ) AS tblMark\n"
            //+ "        JOIN dbo.tblCourse ON dbo.tblCourse.code = tblMark.courseCode;";
            String sql = "SELECT * FROM  tblStudent";
            cmd = new SqlCommand(sql, conn);
            
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                String sLastName = reader.GetString(2);
                String sFirstName = reader.GetString(1);
                String sDayOfBirth = reader.GetDateTime(3).ToString("dd/MM/yyyy");
                Boolean sSex = reader.GetBoolean(4);
                String sClassCode = reader.GetString(5);


                txtFirstName.Text = sFirstName;
                txtLastName.Text = sLastName;
                txtDateOfBirth.Text = sDayOfBirth;
                if(sSex == true)
                {
                    txtSex.Text = "Nu";
                }
                else
                {
                    txtSex.Text = "Nam";
                }
                txtClassCode.Text = sClassCode;
               

            }
        }

        public void loadAvgMark(String studentCode)
        {
            MyConnection.OpenDB();
            String sql = "SELECT	tblMark.avgMark FROM(SELECT    AVG(tblMarkReport.mark) AS avgMark FROM dbo.tblMarkReport WHERE studentCode = '" + studentCode + "') AS tblMark";
         
            cmd = new SqlCommand(sql, conn);

            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                float sAvgMark = reader.GetFloat(2);

                float.Parse(txtAvgMark.Text) = sAvgMark;
            }
        }
        private void Init()
        {
        }

        private void MainFrame_Load(object sender, EventArgs e)
        {
            this.ShowCombobox();
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            String studentCode = (String)cbbCode.SelectedValue;

            // show dataGridView Mark
            LoadDgv(studentCode);
            loadStudentInfo(studentCode);
            loadAvgMark(studentCode);
            // show student info

        }

        private void cbbCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void cbbCode_SelectedValueChanged(object sender, EventArgs e)
        {
            
            //conn = myConn.GetConn();
            //conn.Open();
            //String sql = "SELECT  tblMark.courseCode ,\n"
            //+ "        tblCourse.name ,\n"
            //+ "        tblMark.avgMark\n"
            //+ "FROM    ( SELECT    courseCode ,\n"
            //+ "                    AVG(tblMarkReport.mark) AS avgMark\n"
            //+ "          FROM      dbo.tblMarkReport\n"
            //+ "          WHERE     studentCode = '" + studentCode + "'\n"
            //+ "          GROUP BY  tblMarkReport.courseCode\n"
            //+ "        ) AS tblMark\n"
            //+ "        JOIN dbo.tblCourse ON dbo.tblCourse.code = tblMark.courseCode;";

            
            //cmd = new SqlCommand(sql, conn);
            //SqlDataReader reader = cmd.ExecuteReader();
            //while (reader.Read())
            //{
            //    String sLastName = reader.GetString(1);
            //    String sFirstName = reader.GetString(2);
            //    DateTime sDayOfBirth = reader.GetDateTime(3);
            //    Boolean sSex = reader.GetBoolean(4);
            //    String sClassCode = reader.GetString(5);

            //    txtFirstName.Text = sLastName;

            //}

        }

       
        private void txtFirstName_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
