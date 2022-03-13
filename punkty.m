nPoints = 5;%liczba zdefiniwanych punktów drogi (1, 2, 3...)
points = zeros(5,nPoints);%definicja tablicy 5wierszowej wype³nionej wierszami
%ka¿da kolumna tablicy to oddzielny punkt drogi
%w ka¿dym wierszu znajduj¹ siê kolejno:
%Xe (m)
%Ye (m)
%h (m)
%psi (rad)
%delay (s)
points(:,1) = [0;0;1.5;0;5];%definicja pierwszego punktu drogi na wysokoœci
% 1.5m, czas oczekiwania w punkcie 5sekund'
points(:,2) = [0;0;2.5;0;2]; % definicja drugiego punktu
points(:,3) = [1;;0;2.5;0;2];
points(:,4) = [1;1;2.5;pi;2];
%points(:,5) = [1;1;0;2];

points(:,nPoints) = [1;1;0;pi;2]; %definicja ostatniego punktu
%nale¿y pamiêtaæ ¿e ostani punkt definiujê
%l¹dowanie czyli wspó³rzêdne Xe,Ye z punktu
%nPoints-1 nie zmieniaj¹ siê, zmienia siê tylko
%wysokoœæ na wartoœæ = 0