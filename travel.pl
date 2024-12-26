/*
 * travel.pl
 * By Franz Zbinden Garcia
 * This is a knowledge base of fictitious travel information.
 */

% by_car(?Origin, ?Destination)
% Succeeds if Destination is reachable from Origin by car.
by_car(bayamon, guaynabo).
by_car(guaynabo, san_juan).
by_car(san_juan, carolina).
by_car(aguadilla, mayaguez).
by_car(mayaguez, san_german).

% by_train(?Origin, ?Destination)
% Succeeds if Destination is reachable from Origin by train.
by_train(bayamon, aguadilla).
by_train(aguadilla, cabo_rojo).
by_train(san_german, ponce).
by_train(carolina, fajardo).
by_train(carolina, ponce).

% by_plane(?Origin, ?Destination)
% Succeeds if Destination is reachable from Origin by plane.
by_plane(carolina, orlando).
by_plane(carolina, new_york).
by_plane(carolina, paris).
by_plane(paris, tokio).
by_plane(new_york, san_antonio).
by_plane(san_antonio, san_francisco).

% By car
% base case
travelByCar(From, Destination) :-
    by_car(From, Destination).
% recursive case
travelByCar(From, Destination) :-
    by_car(From, Somewhere),
	travelByCar(Somewhere,Destination).  

% By train
travelByTrain(From,Destination):-
    by_train(From,Destination).

travelByTrain(From,Destination):-
    by_train(From, Somewhere),
	travelByTrain(Somewhere,Destination).

% By plane                 
travelByPlane(From,Destination):-
    by_plane(From,Destination).

travelByPlane(From,Destination):-
    by_plane(From, Somewhere),
	travelByPlane(Somewhere,Destination).

% general travel
% travel in CAR
travel(From, Destination) :-
    travelByCar(From, Destination).

% travel in TRAIN
travel(From, Destination) :-
    travelByTrain(From, Destination).

% travel in PLANE
travel(From, Destination) :-
    travelByPlane(From, Destination).

% travel in CAR recursive
travel(From, Destination) :-
    by_car(From, Intermediate),
    travel(Intermediate, Destination).

% travel in TRAIN recursive
travel(From, Destination) :-
    by_train(From, Intermediate),
    travel(Intermediate, Destination).

% travel in PLANE recursive
travel(From, Destination) :-
    by_plane(From, Intermediate),
    travel(Intermediate, Destination).
                 