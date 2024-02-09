-module(apollo_main_controller).
-export([
         index/1,
         eel/1
        ]).

index(_Req) ->
    {ok, [{message, "Hello world!"}]}.

eel(_Req) ->
    {IoData, _Snapshot} = my_app:render(#{'Title' => <<"Hey!">>, 'Name' => <<"World">>}),
    {status, 200, #{}, IoData}.
