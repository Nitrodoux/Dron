nPoints = 5;%liczba zdefiniwanych punkt�w drogi (1, 2, 3...)
points = zeros(5,nPoints);%definicja tablicy 5wierszowej wype�nionej wierszami
%ka�da kolumna tablicy to oddzielny punkt drogi
%w ka�dym wierszu znajduj� si� kolejno:
%Xe (m)
%Ye (m)
%h (m)
%psi (rad)
%delay (s)
points(:,1) = [0;0;1.5;0;5];%definicja pierwszego punktu drogi na wysoko�ci
% 1.5m, czas oczekiwania w punkcie 5sekund'
points(:,2) = [0;0;2.5;0;2]; % definicja drugiego punktu
points(:,3) = [1;;0;2.5;0;2];
points(:,4) = [1;1;2.5;pi;2];
%points(:,5) = [1;1;0;2];

points(:,nPoints) = [1;1;0;pi;2]; %definicja ostatniego punktu
%nale�y pami�ta� �e ostani punkt definiuj�
%l�dowanie czyli wsp�rz�dne Xe,Ye z punktu
%nPoints-1 nie zmieniaj� si�, zmienia si� tylko
%wysoko�� na warto�� = 0