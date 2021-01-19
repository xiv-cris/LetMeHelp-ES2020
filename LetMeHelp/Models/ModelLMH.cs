using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace LetMeHelp.Models
{
    public class ModelLMH : DbContext
    {
        // Your context has been configured to use a 'ModelLMH' connection string from your application's 
        // configuration file (App.config or Web.config). By default, this connection string targets the 
        // 'LetMeHelp.Models.ModelLMH' database on your LocalDb instance. 
        // 
        // If you wish to target a different database and/or database provider, modify the 'ModelLMH' 
        // connection string in the application configuration file.
        public ModelLMH(): base("name=ModelLMH")
        {
        }

        // Add a DbSet for each entity type that you want to include in your model. For more information 
        // on configuring and using a Code First model, see http://go.microsoft.com/fwlink/?LinkId=390109.

        public virtual DbSet<User> Utilizadores { get; set; }
        public virtual DbSet<Post> Posts { get; set; }

        // public virtual DbSet<MyEntity> MyEntities { get; set; }
    }

    public class User
    {
        [Key]
        public int UserId { get; set; }
        public string UserFullName { get; set; }
        public DateTime UserBirthday { get; set; }
        public string UserMail { get; set; }
        public int UserPhone { get; set; }
        public string UserPass { get; set; }
        public string UserBio { get; set; }
        public string UserGender { get; set; }
        public string UserPicLink { get; set; }
        public int UserReputation { get; set; }

        public virtual List<Post> Post { get; set; }
    }

    public class Post
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int PostId { get; set; }
        public string PostHeader { get; set; }
        public string PostDescription { get; set; }
        public string PostOfertaInicial { get; set; }
        public string PostImg { get; set; }
        public DateTime PostDate { get; set; }

        public int UserId { get; set; }
        public virtual User User { get; set; }

    }


    //public class MyEntity
    //{
    //    public int Id { get; set; }
    //    public string Name { get; set; }
    //}
}