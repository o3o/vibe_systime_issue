import vibe.vibe;
import std.experimental.logger;

shared static this() {
   auto router = new URLRouter;
   RecipeController ctrl = new RecipeController();
   router.registerWebInterface(ctrl);

   auto settings = new HTTPServerSettings;
   settings.bindAddresses = ["::1", "127.0.0.1"];
   settings.port = 8080;

   listenHTTP(settings, router);
}

struct Recipe {
   long id;
   string recipeName;
   string partNumber;
   string description;
   SysTime createdAt;
}

final class RecipeController {
   @path("/recipe/update") void postRecipeUpdate(Recipe r) {
      trace(r);
   }
}
