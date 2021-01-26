using LetMeHelp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace LetMeHelp
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (var db = new ModelLMH())
            {
                //var teste = db.Utilizadores.First();
                //db.Posts.Add(new Post() { PostId = 1, PostDate = DateTime.Now, PostHeader = "Acartador de Batatas", PostDescription = "Preciso de alguem para acartar batatas em troca de 30kg das mesmas", UserId = 50, User= teste });
                //db.SaveChanges();

                if (db.Posts.Count() == 0)
                {

                }
                else
                {
                    DivNoPosts.Visible = false;


                    foreach (var post in db.Posts.ToList().OrderBy(p => p.PostDate))
                    {
                        HtmlGenericControl example = new HtmlGenericControl("div");

                        HtmlGenericControl title = new HtmlGenericControl("h2");
                        title.InnerText = post.PostHeader;
                        title.ID = post.PostId.ToString();

                        #region Criar um <a href>

                        HtmlGenericControl redirector = new HtmlGenericControl("a");
                        redirector.InnerHtml = $"<a href=veranuncio?postId={post.PostId}>";

                        #endregion


                        HtmlImage image = new HtmlImage();

                        image.Src = post.PostImg;
                        image.Alt = "Post Image";

                        image.Height = 100;
                        image.Width = 100;

                        #region Add Elements of Post

                        redirector.Controls.Add(title);
                        redirector.Controls.Add(image);

                        example.Controls.Add(redirector);

                        //example.Controls.Add(title);
                        //example.Controls.Add(image);

                        #endregion

                        postsDedicated.Controls.Add(example);
                        postsDedicated.Controls.Add(new HtmlGenericControl("br"));
                    }
                }
            }
        }
    }
}