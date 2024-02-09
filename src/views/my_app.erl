-module(my_app).

-export([render/1, render/2]).

-include_lib("eel/include/eel.hrl").

render(Bindings) ->
    {ok, Snapshot} = eel:compile(<<
        "<html>"
        "<head>"
            "<title><%= Title .%></title>"
        "</head>"
        "<body>"
            "This looks good"
            "Hello, <%= Name .%>!"
        "</body>"
        "</html>"
    >>),
    render(Bindings, Snapshot).

render(Bindings, Snapshot) ->
    {ok, RenderSnapshot} = eel_renderer:render(Bindings, Snapshot),
    {eel_evaluator:eval(RenderSnapshot), RenderSnapshot}.