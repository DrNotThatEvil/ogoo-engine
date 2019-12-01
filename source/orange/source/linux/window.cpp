#include "orange.h"
#include "window.h"

#include <cstring>

#include <wayland-client.h>
#include <wayland-server.h>
#include <wayland-client-protocol.h>
#include <wayland-egl.h>

#include <EGL/egl.h>
#include <EGL/eglplatform.h>

static struct wl_display *display;
static struct wl_compositor* compositor = NULL;
static struct wl_shell* shell = NULL;


namespace orange 
{

    struct og_windowContext 
    {   
        struct wl_display* wlDisplay;
        struct wl_surface* wlSurface;
        struct wayland_context* wlContext;
    };


    void registry_global(void* data, struct wl_registry* registry, uint32_t name, const char* interface, uint32_t version)
    {
        struct og_windowContext* cp = (struct og_windowContext*) data;

        if (!strcmp(interface,"wl_compositor")) {
		    compositor = wl_registry_bind (registry, name, &wl_compositor_interface, 1);
        }
        else if (!strcmp(interface,"wl_shell")) {
            shell = wl_registry_bind (registry, name, &wl_shell_interface, 1);
        }
    }

    const struct wl_registry_listener wl_registry_listener = { registry_global, NULL };

    void InitNativeDisplay(og_windowContext* cp)
    {
        display = wl_display_connect(NULL);

        struct wl_registry *registry = wl_display_get_registry(display);
        wl_registry_add_listener(registry, &wl_registry_listener, (void*) cp);


    }


}