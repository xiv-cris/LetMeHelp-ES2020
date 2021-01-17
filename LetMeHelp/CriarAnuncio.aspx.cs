using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LetMeHelp.Models;

namespace LetMeHelp
{
    public partial class CriarAnuncio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var uid = Session["uID"];
            if (Session["uID"] == null)
                Response.Redirect("~/");

            divErrors.Visible = false;
        }

        protected void ButtonCriar_Click( object sender, EventArgs e)
        {
            if(String.IsNullOrWhiteSpace(TextBoxTitulo.Text))
            {
                divErrors.Visible = true;
                StatusText.Text = "O anuncio precisa de um Titulo";
                TextBoxTitulo.Focus();
            }else if (String.IsNullOrWhiteSpace(TextBoxDescricao.Text))
            {
                divErrors.Visible = true;
                StatusText.Text = "O anuncio precisa de uma Descricao";
                TextBoxDescricao.Focus();
            }
            else
            {
                CreatePost();
            }


        }

        private void CreatePost()
        {
            using( var db = new ModelLMH())
            {
                var _user = db.Utilizadores.ToList().Find(i => i.UserId == int.Parse(Session["uID"].ToString()));
                var _currentPostMaxId = db.Posts.OrderByDescending(x => x.PostId).First().PostId;


                Post _post = new Post()
                {
                    PostDate = DateTime.Now,
                    PostHeader = TextBoxTitulo.Text,
                    PostDescription = TextBoxDescricao.Text,
                    UserId = _user.UserId,
                    User = _user,
                    PostId = _currentPostMaxId + 1
                };

                db.Posts.Add(_post);
                db.SaveChanges();

                Response.Redirect($"~/VerAnuncio?postId={_post.PostId}");
            }
        }
    }
}