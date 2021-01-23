namespace LetMeHelp.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class v2 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Posts", "PostOfertaInicial", c => c.String());
            AddColumn("dbo.Posts", "PostImg", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Posts", "PostImg");
            DropColumn("dbo.Posts", "PostOfertaInicial");
        }
    }
}
