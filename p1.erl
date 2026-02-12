% team: Tracy Dang, Bennett Rakower, Megha Thumma

-module(p1).
-export([start/0]).

start() ->
    io:format("Enter a number: "),
    Input = io:get_line(""),
    Str = string:trim(Input),
    case catch list_to_integer(Str) of
        {'EXIT', _} ->
            io:format("not an integer~n");
        N when is_integer(N) ->
            handle_number(N)
    end.

handle_number(N) when N < 0 ->
    Result = trunc(math:pow(abs(N), 7)),
    io:format("~p~n", [Result]);

handle_number(0) ->
    io:format("0~n");

handle_number(N) when N > 0 ->
    case N rem 7 of
        0 ->
            Result = math:pow(N, 1/5),
            io:format("~p~n", [Result]);
        _ ->
            Result = factorial(N),
            io:format("~p~n", [Result])
    end.

factorial(0) -> 1;
factorial(N) -> N * factorial(N - 1).