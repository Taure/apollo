-module(apollo_router).
-behaviour(nova_router).

-export([
         routes/1
        ]).

%% The Environment-variable is defined in your sys.config in {nova, [{environment, Value}]}
routes(_Environment) ->
    [#{prefix => "",
      security => false,
      routes => [
                 {"/", { apollo_main_controller, index}, #{methods => [get]}},
                 {"/eel", { apollo_main_controller, eel}, #{methods => [get]}},
                 {"/assets/[...]", "assets"}
                ]
      }].
