namespace LetMeHelp.Migrations
{
    using LetMeHelp.Models;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<LetMeHelp.Models.ModelLMH>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
            AutomaticMigrationDataLossAllowed = true;
        }

        protected override void Seed(LetMeHelp.Models.ModelLMH context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method
            //  to avoid creating duplicate seed data.

            if (!context.Utilizadores.Any())
            {
                context.Utilizadores.AddOrUpdate(
                    new User { UserFullName = "João Abreu", UserMail = "joao@gmail.com", UserPass = "12345678", UserPhone = 927378123, UserGender = "Masculino", UserBirthday = DateTime.Parse("1997-10-10"), UserBio = "Sou pescador", UserPicLink = "https://www.clipartmax.com/png/middle/296-2969961_no-image-user-profile-icon.png", UserReputation = 0 }
                    //new User { UserFullName = "Juan Silva", UserMail = "jass@jass.com", UserPass = "123456", UserPhone = 927378012, ,UserReputation = 0 }
                    );
                context.SaveChanges();
            }

            if (!context.Posts.Any())
            {
                context.Posts.AddOrUpdate(
                    new Post { PostHeader = "Acartar", PostDescription = "Acartador de semilhas em troca de 30kg delas!", PostDate = DateTime.Parse("2020-04-05"), UserId = 1 }
                    //new Post { PostHeader = "Força", PostDescription = "Acartador de semilhas em troca de 30kg delas!", PostDate = DateTime.Parse("2020-11-05"), UserId = 2 }
                    );
                context.SaveChanges();
            }

        }
    }
}
