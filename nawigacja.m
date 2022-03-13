function [psiRef, hRef, XeRef, YeRef] = fcn(points, psi, Xe, Ye, h, time )
%#codegen
%
% Macierz zdefiniowanych punktów drogi nosi nazwê "ponits"
%budowê jej okreœla m-plik z za³¹cznika 1
%time - czas globalny - symulacji
%P to wektor pozycji (Xe,Ye)
%
% liczba zdefiniowanych punktów drogi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%nPoints = size(points,5) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% definicja wskaŸnika o nazwie "pointer" do aktualnego punktu drogi
%definicja za pomoc¹ zmiennej persistent
%zmienne persistent s¹ odmian¹ zmiennych lokalnych,
%które nie znikaj¹ z pamiêci po zakoñczeniu M-funkcji, w której zosta³y
%zdefiniowane. Dlatego ta M-funkcja ma do nich dostêp po jej ponownym
%wywo³aniu. Nie s¹ widoczne dla innych M-funkcji. Jest to odpowiednik
%zmiennych statycznych w C/C++
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
persistent pointer;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definicj zmiennej do odmierzania czasu okreœlajacego opóŸnienie (czas
% pozostania w danym punkcie dorgi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
persistent t0 ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inicjalizacja zmiennych typu persistent (konieczna)
% sprawdzenie zawartoœci zmiennej pointer (zwracana wartoœæ = 1
% jeœli tablica jest pusta
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if isempty(pointer)
pointer = 1;
end
if isempty(t0)
t0 = 0;
end
%W tym miejscu nale¿y sprawdziæ warunek czy ró¿nica pomiêdzy aktualn¹
%pozycj¹ œmig³owca a zadan¹ (z zdanego punktu drogi) jest mniejsza ni¿
%okreœlona w zadaniu oraz czy ró¿nica pomiêdzy wysokoœci¹ zadan¹ i mierzon¹
% œmig³owca jest mniejsza ni¿ zdefiniowana oraz ró¿nica pomiêdzy
%kierunkiem lotu (kursem) zadanym i mierzonym jest mniejsza niz
%zdefiniowana w okreœlonym punkcie drogi
if [points(4,pointer),points(3,pointer),points(1,pointer),points(2,pointer)]-[psi, h, Xe, Ye]>[0,0,0,0];
%nastêpnie nale¿y sprawdziæ warunek czy wskaŸnik do aktualnego punktu drogi
%(pointer) jest ró¿ny ni¿ ca³kowita liczba zdefiniowanych punktów
%(czy nie jest to ostatni punkt do zalicznia)
if pointer ~= 5
%jeœli to nie jest ostatni punkt to nale¿y uwzglêdniæ warunek
%oczekiwania w danym punkcie/ nale¿y sprawdzaæ czy
%t0=0 (wtedy t0=time) a nastêpnie czy ró¿nica time-t0 jest wiêksza
%ni¿ zadeklarowany czas oczekiwania w
%danym punkcie
if t0==0
    t0=time;
else
if time-t0>points(5,pointer)
%jeœli czas oczekiwania zosta³ przekroczony (zrealizowany) - time-t0 > …
if pointer<5
%i jeœli to nie jest ostatni punkt drogi (wskaŸnik do danego punktu
%jest mniejszy ni¿ ca³kowita liczba punktów) – pointer < ca³k. Liczba pkt. to
%zwiêksz zmienn¹ pointer i wyzeruj t0
pointer=pointer+1;
t0=0;
end
end
end
end
end
hRef = points(3, pointer) ;
psiRef = points(4, pointer) ;
XeRef = points(1, pointer) ;
YeRef = points(2, pointer);