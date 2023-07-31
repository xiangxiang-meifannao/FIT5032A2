using FIT5032A2FXY.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace FIT5032A2FXY.Controllers
{
    public class EmailController : Controller
    {
        // GET: Email
        public ActionResult Index()
        {
            return View();
        }

        // POST: Email/Send
        [HttpPost]
        public String Send()
        {
            // Store the attachment in local storage.
            var Str1 = Request.Files[0].FileName.Split('.');
            var FileType = Str1[Str1.Length - 1];
            var FilePath =
                Server.MapPath("~/Uploads/") +
                string.Format(@"{0}", Guid.NewGuid()) +
                "." + FileType;
            Request.Files[0].SaveAs(FilePath);
            if (ModelState.IsValid)
            {
                // Send confirmation email.
                var mail = new MailMessage();
                mail.To.Add(new MailAddress(Request.Form["EmailAddress"]));
                mail.From = new MailAddress("xxmfn1228@outlook.com");

                mail.Subject = "Appointment Conformation";
                mail.Body = 
                    "You made an appointment:\n" +
                    "Student ID: " + Request.Form["StudentID"] + "\n" +
                    "Engineer ID: " + Request.Form["EngineerID"] + "\n" +
                    "Date: " + Request.Form["AppointmentDate"];
                mail.IsBodyHtml = false;

                var attachment = new System.Net.Mail.Attachment(FilePath);
                mail.Attachments.Add(attachment);

                var smtp = new SmtpClient();
                smtp.Host = "smtp.office365.com";
                smtp.Port = 587;
                smtp.EnableSsl = true;
                smtp.Credentials = new System.Net.NetworkCredential
                    ("xxmfn1228@outlook.com", "fxy19991228123");

                smtp.Send(mail);
                return "Success";
            }
            return "Database Unavailable.";
        }
    }
}
