using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;
using System.IO;
using System.Text;


/// <summary>
/// Summary description for Intraction
/// </summary>
/// 
namespace manodisha_msgmail
{
    public class Intraction
    {
        public int SendSmsMyntra(string YouMob, string Msg, string UrId, string UrPwd)
        {
            int flg = 0;
            string vurl = "http://smsdeals.wayswebdevelopment.com/sendsms?uname=" + UrId + "&pwd=" + UrPwd + "&senderid=" + "BKCINE" + "&to=" + YouMob + "&msg=" + Msg + "&route=T";
            WebRequest req = WebRequest.Create(vurl);
            HttpWebResponse res = (HttpWebResponse)req.GetResponse();
            flg = 1;
            return flg;
        }

        public int SendMailFromSenGrid(string EmailID, string FullName, string UrId, string UrPwd, string FromEmail, string FromName, string SubJect, string Msg)
        {
            int flg = 0;
            try
            {
                MailMessage mailMsg = new MailMessage();
                mailMsg.To.Add(new MailAddress(EmailID, FullName));
                mailMsg.From = new MailAddress(FromEmail, FromName);
                mailMsg.Subject = SubJect;
                mailMsg.IsBodyHtml = true;
                mailMsg.Body = Msg;
                SmtpClient smtpClient = new SmtpClient("smtp.sendgrid.net", Convert.ToInt32(587));
                System.Net.NetworkCredential credentials = new System.Net.NetworkCredential(UrId, UrPwd);
                smtpClient.Credentials = credentials;

                smtpClient.Send(mailMsg);
                flg = 1;
            }
            catch
            {
                flg = 0;
            }
            return flg;
        }
    }
}