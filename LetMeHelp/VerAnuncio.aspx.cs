using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LetMeHelp.Models;

namespace LetMeHelp
{
    public partial class VerAnuncio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            divMessage.Visible = false;
            divErro.Visible = false;

            if (Request.QueryString["postId"] == null)
                Response.Redirect("~/");

            int postId = int.Parse(Request.QueryString["postId"]);

            Post_Load(postId);

            if (Session["uID"] == null)
            {
                ContactInfo.Visible = false;
            }
            else
                UserPost_Load(postId);
        }

        protected void Post_Load(int apostId)
        {
            int _postId = apostId;

            using (var db = new ModelLMH())
            {
                var post = db.Posts.ToList().Find(i => i.PostId == _postId);

                Titulo.InnerText = post.PostHeader;
                descr.Text = post.PostDescription;
                oferta.Text = post.PostOfertaInicial;
                Data.Text = post.PostDate.ToString();
                imgPost.ImageUrl = post.PostImg;
            }
        }

        protected void UserPost_Load(int apostId)
        {
            int _postId = apostId;

            using (var db = new ModelLMH())
            {
                var post = db.Posts.ToList().Find(i => i.PostId == _postId);

                var user = db.Utilizadores.ToList().Find(i => i.UserId == post.UserId);


                ImgPerfil.ImageUrl = user.UserPicLink;
                anunciante.InnerText = user.UserFullName;
                anuncDescr.Text = user.UserBio;
                anuncTel.Text = user.UserPhone.ToString();
            }
        }

        protected void ButtonEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                using (var db = new ModelLMH())
                {
                    var post = db.Posts.ToList().Find(i => i.PostId == int.Parse(Request.QueryString["postId"]));
                    var user = db.Utilizadores.ToList().Find(i => i.UserId == post.UserId);

                    var userSubmit = db.Utilizadores.ToList().Find(i => i.UserId == int.Parse(Session["uID"].ToString()));

                    SendEmail(user.UserMail.Trim(), post.PostHeader, userSubmit.UserMail);
                }
            }
            catch (Exception ex)
            {
                ErroEnviar.Text = "Falha ao enviar a mensagem!\n" + ex;
                divErro.Visible = true;
            }
        }

        private void SendEmail(string aMailTo, string aPostTitle, string aMailFrom)
        {
            MailMessage mail = new MailMessage();
            mail.To.Add(aMailTo);
            mail.From = new MailAddress("let.me.help.es@gmail.com");
            mail.Subject = "LetMeHelp - " + aPostTitle;
            mail.Body = TextAreaDescription.Text.Trim(); //Request.Form["txtmsg"];
            mail.Body += "\n\n\n\n\t Nao responda a este email!\n\t Responda para o seguinte email: " + aMailFrom;
            
            SmtpClient smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Credentials = new System.Net.NetworkCredential("let.me.help.es@gmail.com", "LetMeHelp2020"),
                EnableSsl = true
            };

            smtp.Send(mail);
            EnvioOK.Text = "Mensagem enviada com sucesso!";
            divMessage.Visible = true;
        }
    }
}