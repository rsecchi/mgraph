function v = Scircle_in(S, n=1000)

    alpha = [0:2*pi/n:pi];  
	Gs = transpose([cos(alpha)+i*sin(alpha)]);
    v = S(1,1)+S(1,2)*S(2,1).*Gs./(1-S(2,2).*Gs);
    plot(real(v),imag(v),'r');
    hold on;
	
    alpha = [pi:2*pi/n:2*pi];
    Gs = transpose([cos(alpha)+i*sin(alpha)]);
    v = S(1,1)+S(1,2)*S(2,1).*Gs./(1-S(2,2).*Gs);
    plot(real(v),imag(v),'b');
    hold on;
	
	circle(S(1,1)+S(1,2)*S(2,1)/(1-S(2,2)),0.005)
	hold on;
end