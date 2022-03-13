figure(2)
plot(time,x_zad,time,result(:,1));
legend('X zad','X mierz');
xlabel('Czas [s]');ylabel('X [m]');
grid on;
figure(3)
plot(time,y_zad,time,result(:,2));
legend('Y zad','Y mierz');
xlabel('Czas [s]');ylabel('Y [m]');
grid on;
figure(4)
plot(time,z_zad,time,result(:,3));
legend('Z zad','Z mierz');
xlabel('Czas [s]');ylabel('Z [m]');
grid on;
figure(5)
plot(time,yaw_zad,time,result(:,4));
legend('yaw zad','yaw mierz');
xlabel('Czas [s]');ylabel('yaw [rad]');
grid on;
