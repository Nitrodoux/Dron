function [psiRef, hRef, XeRef, YeRef] = fcn(points, psi, Xe, Ye, h, time )
%#codegen
%
% Macierz zdefiniowanych punkt�w drogi nosi nazw� "ponits"
%budow� jej okre�la m-plik z za��cznika 1
%time - czas globalny - symulacji
%P to wektor pozycji (Xe,Ye)
%
% liczba zdefiniowanych punkt�w drogi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%nPoints = size(points,5) ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% definicja wska�nika o nazwie "pointer" do aktualnego punktu drogi
%definicja za pomoc� zmiennej persistent
%zmienne persistent s� odmian� zmiennych lokalnych,
%kt�re nie znikaj� z pami�ci po zako�czeniu M-funkcji, w kt�rej zosta�y
%zdefiniowane. Dlatego ta M-funkcja ma do nich dost�p po jej ponownym
%wywo�aniu. Nie s� widoczne dla innych M-funkcji. Jest to odpowiednik
%zmiennych statycznych w C/C++
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
persistent pointer;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definicj zmiennej do odmierzania czasu okre�lajacego op�nienie (czas
% pozostania w danym punkcie dorgi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
persistent t0 ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Inicjalizacja zmiennych typu persistent (konieczna)
% sprawdzenie zawarto�ci zmiennej pointer (zwracana warto�� = 1
% je�li tablica jest pusta
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if isempty(pointer)
pointer = 1;
end
if isempty(t0)
t0 = 0;
end
%W tym miejscu nale�y sprawdzi� warunek czy r�nica pomi�dzy aktualn�
%pozycj� �mig�owca a zadan� (z zdanego punktu drogi) jest mniejsza ni�
%okre�lona w zadaniu oraz czy r�nica pomi�dzy wysoko�ci� zadan� i mierzon�
% �mig�owca jest mniejsza ni� zdefiniowana oraz r�nica pomi�dzy
%kierunkiem lotu (kursem) zadanym i mierzonym jest mniejsza niz
%zdefiniowana w okre�lonym punkcie drogi
if [points(4,pointer),points(3,pointer),points(1,pointer),points(2,pointer)]-[psi, h, Xe, Ye]>[0,0,0,0];
%nast�pnie nale�y sprawdzi� warunek czy wska�nik do aktualnego punktu drogi
%(pointer) jest r�ny ni� ca�kowita liczba zdefiniowanych punkt�w
%(czy nie jest to ostatni punkt do zalicznia)
if pointer ~= 5
%je�li to nie jest ostatni punkt to nale�y uwzgl�dni� warunek
%oczekiwania w danym punkcie/ nale�y sprawdza� czy
%t0=0 (wtedy t0=time) a nast�pnie czy r�nica time-t0 jest wi�ksza
%ni� zadeklarowany czas oczekiwania w
%danym punkcie
if t0==0
    t0=time;
else
if time-t0>points(5,pointer)
%je�li czas oczekiwania zosta� przekroczony (zrealizowany) - time-t0 > �
if pointer<5
%i je�li to nie jest ostatni punkt drogi (wska�nik do danego punktu
%jest mniejszy ni� ca�kowita liczba punkt�w) � pointer < ca�k. Liczba pkt. to
%zwi�ksz zmienn� pointer i wyzeruj t0
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