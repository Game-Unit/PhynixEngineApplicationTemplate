#include <Layer.h>
#include <raylib.h>

class TemplateLayer : public Engine_Core::Layer
{
    public:
        virtual void OnUpdate(float ts) {}

        virtual void OnRender()
        {
            DrawText("Hello World", 960, 540, 50, RED);
        }
};
