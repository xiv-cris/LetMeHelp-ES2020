using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LetMeHelp.Models;

namespace LetMeHelp
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Adding one Post

            
            

            #endregion

            using (var db = new ModelLMH())
            {
                //var teste = db.Utilizadores.First();
                //db.Posts.Add(new Post() { PostId = 1, PostDate = DateTime.Now, PostHeader = "Acartador de Batatas", PostDescription = "Preciso de alguem para acartar batatas em troca de 30kg das mesmas", UserId = 50, User= teste });
                //db.SaveChanges();

                if (db.Posts.Count() == 0)
                {
                    form1.Visible = false;
                }
                else
                {
                    DivNoPosts.Visible = false;
                    Listbox_Posts.Items.Clear();
                    foreach (var _post in db.Posts)
                    {
                        Listbox_Posts.Items.Add(_post.PostHeader);
                    }
                    Button1.Text = "+";
                }
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var _selectedPostName = Listbox_Posts.SelectedItem;

            if (_selectedPostName == null)
                return;
            
            using(var db = new ModelLMH())
            {
                var _selectedPost = db.Posts.ToList().Find(i => i.PostHeader == _selectedPostName.ToString());

                
            }
        }
    }
}