using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(FIT5032A2FXY.Startup))]
namespace FIT5032A2FXY
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
