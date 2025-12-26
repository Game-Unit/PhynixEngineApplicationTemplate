#include <Application.h>
#include "TemplateLayer.h"

int main()
{
    Engine_Core::ApplicationSettings settings;
    settings.applicationName = "Templte";
    settings.width = 1920;
    settings.hight = 1080;

    Engine_Core::Application app(settings);
    app.PushLayer<TemplateLayer>();
    app.Run();
}
