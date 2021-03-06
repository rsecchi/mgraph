function [Zr1,Zr2,delta] = Zphi(Z,Xb)
	
	Z11 = Z(1,1);
	Z12 = Z(1,2);
	Z21 = Z(2,1);
	Z22 = Z(2,2);
	
	R11 = real(Z11); X11 = imag(Z11);
	R12 = real(Z12); X12 = imag(Z12);
	R21 = real(Z21); X21 = imag(Z21);
	R22 = real(Z22); X22 = imag(Z22);
	
	delta = -4*R11*R22*Xb^2+R21^2*Xb^2+2*R12*R21*Xb^2+R12^2*Xb^2-4*R11*R22*X21*Xb+2*R12*R21*X21*Xb+2*R12^2*X21*Xb-4*R11*R22*X12*Xb+2*R21^2*X12*Xb+2*R12*R21*X12*Xb+R12^2*X21^2-4*R11*R22*X12*X21+2*R12*R21*X12*X21+R21^2*X12^2-4*R11^2*R22^2+4*R11*R12*R21*R22;

	Xa1=(X21*((R21+R12)*R22*X12-R22*sqrt(delta))+X22*(R21*sqrt(delta)+R12*sqrt(delta)+(2*R11*R22-R12*R21-R12^2)*X21+(2*R11*R22-R21^2-R12*R21)*X12)-R22*X12*
        sqrt(delta)+(2*R21+2*R12)*R22*Xb^2+((-R21^2-2*R12*R21-R12^2)*X22+(R21+R12)*R22*X21+(R21+R12)*R22*X12)*Xb-R12*R22*X21^2-R21*R22*X12^2
		+(2*R11*R21+2*R11*R12)*R22^2+(-2*R12*R21^2-2*R12^2*R21)*R22)/(-R21*sqrt(delta)-R12*sqrt(delta)
        +(R21^2+2*R12*R21+R12^2)*Xb+(-2*R11*R22+R12*R21+R12^2)*X21+(-2*R11*R22+R21^2+R12*R21)*X12);

   Xc1=-(sqrt((-4*R11*R22+R21^2+2*R12*R21+R12^2)*Xb^2+((-4*R11*R22+2*R12*R21+2*R12^2)*X21+(-4*R11*R22+2*R21^2+2*R12*R21)*X12)*Xb+R12^2*X21^2+
       (2*R12*R21-4*R11*R22)*X12*X21+R21^2*X12^2-4*R11^2*R22^2+4*R11*R12*R21*R22)+(-R21-R12)*Xb-R12*X21-R21*X12+2*R22*X11)/(2*R22);
	
	
Xa2 = (X21*(R22*sqrt(-4*R11*R22*Xb^2+R21^2*Xb^2+2*R12*R21*Xb^2+R12^2*Xb^2-4*R11*R22*X21*Xb+2*R12*R21*X21*Xb+2*R12^2*X21*Xb-4*R11*R22*X12*Xb+2*R21^2*
X12*Xb+2*R12*R21*X12*Xb+R12^2*X21^2-4*R11*R22*X12*X21+2*R12*R21*X12*X21+R21^2*X12^2-4*R11^2*R22^2+4*R11*R12*R21*R22)+(R21+R12)*R22*X12)+X22*(-R21*
sqrt(-4*R11*R22*Xb^2+R21^2*Xb^2+2*R12*R21*Xb^2+R12^2*Xb^2-4*R11*R22*X21*Xb+2*R12*R21*X21*Xb+2*R12^2*X21*Xb-4*R11*R22*X12*Xb+2*R21^2*X12*Xb+2*R12*R21*X12*Xb+
R12^2*X21^2-4*R11*R22*X12*X21+2*R12*R21*X12*X21+R21^2*X12^2-4*R11^2*R22^2+4*R11*R12*R21*R22)-R12*sqrt(-4*R11*R22*Xb^2+R21^2*Xb^2+2*R12*R21*Xb^2+R12^2*Xb^2-4*
R11*R22*X21*Xb+2*R12*R21*X21*Xb+2*R12^2*X21*Xb-4*R11*R22*X12*Xb+2*R21^2*X12*Xb+2*R12*R21*X12*Xb+R12^2*X21^2-4*R11*R22*X12*X21+2*R12*R21*X12*X21+R21^2*X12^2
-4*R11^2*R22^2+4*R11*R12*R21*R22)+(2*R11*R22-R12*R21-R12^2)*X21+(2*R11*R22-R21^2-R12*R21)*X12)+R22*X12*sqrt(-4*R11*R22*Xb^2+R21^2*Xb^2+2*R12*R21*Xb^2+
R12^2*Xb^2-4*R11*R22*X21*Xb+2*R12*R21*X21*Xb+2*R12^2*X21*Xb-4*R11*R22*X12*Xb+2*R21^2*X12*Xb+2*R12*R21*X12*Xb+R12^2*X21^2-4*R11*R22*X12*X21+2*R12*R21*X12*X21
+R21^2*X12^2-4*R11^2*R22^2+4*R11*R12*R21*R22)+(2*R21+2*R12)*R22*Xb^2+((-R21^2-2*R12*R21-R12^2)*X22+(R21+R12)*R22*X21+(R21+R12)*R22*X12)*Xb-R12*R22*
X21^2-R21*R22*X12^2+(2*R11*R21+2*R11*R12)*R22^2+(-2*R12*R21^2-2*R12^2*R21)*R22)/(R21*sqrt(-4*R11*R22*Xb^2+R21^2*Xb^2+2*R12*R21*Xb^2+R12^2*Xb^2-4*R11*R22*
X21*Xb+2*R12*R21*X21*Xb+2*R12^2*X21*Xb-4*R11*R22*X12*Xb+2*R21^2*X12*Xb+2*R12*R21*X12*Xb+R12^2*X21^2-4*R11*R22*X12*X21+2*R12*R21*X12*X21+R21^2*X12^2-4*R11^2*
R22^2+4*R11*R12*R21*R22)+R12*sqrt(-4*R11*R22*Xb^2+R21^2*Xb^2+2*R12*R21*Xb^2+R12^2*Xb^2-4*R11*R22*X21*Xb+2*R12*R21*X21*Xb+2*R12^2*X21*Xb-4*R11*R22*X12*Xb+2*
R21^2*X12*Xb+2*R12*R21*X12*Xb+R12^2*X21^2-4*R11*R22*X12*X21+2*R12*R21*X12*X21+R21^2*X12^2-4*R11^2*R22^2+4*R11*R12*R21*R22)+(R21^2+2*R12*R21+R12^2)*Xb+
(-2*R11*R22+R12*R21+R12^2)*X21+(-2*R11*R22+R21^2+R12*R21)*X12);

Xc2 = (sqrt((-4*R11*R22+R21^2+2*R12*R21+R12^2)*Xb^2+((-4*R11*R22+2*R12*R21+2*R12^2)*X21+(-4*R11*R22+2*R21^2+2*R12*R21)*X12)*Xb+R12^2*X21^2+
(2*R12*R21-4*R11*R22)*X12*X21+R21^2*X12^2-4*R11^2*R22^2+4*R11*R12*R21*R22)+(R21+R12)*Xb+R12*X21+R21*X12-2*R22*X11)/(2*R22);


% The solution (Xa3,Xc3) make null the denominator of (Zm12+Zm21)/(Zm22+Zm11)

% Xa3 = -(X21*((R21+R12)*R22*X12-R22*sqrt(-4*R11*R22*Xb^2+R12^2*X21^2-4*R11*R22*X12*X21+2*R12*R21*X12*X21+R21^2*X12^2-4*R11^2*R22^2+4*R11*R12*R21*R22))+
% X22*(R21*sqrt(-4*R11*R22*Xb^2+R12^2*X21^2-4*R11*R22*X12*X21+2*R12*R21*X12*X21+R21^2*X12^2-4*R11^2*R22^2+4*R11*R12*R21*R22)+R12*
% sqrt(-4*R11*R22*Xb^2+R12^2*X21^2-4*R11*R22*X12*X21+2*R12*R21*X12*X21+R21^2*X12^2-4*R11^2*R22^2+4*R11*R12*R21*R22)+(2*R11*R22-R12*R21-R12^2)*X21+
% (2*R11*R22-R21^2-R12*R21)*X12)-R22*X12*sqrt(-4*R11*R22*Xb^2+R12^2*X21^2-4*R11*R22*X12*X21+2*R12*R21*X12*X21+R21^2*X12^2-4*R11^2*R22^2+4*R11*R12*R21*R22)+
% (2*R21+2*R12)*R22*Xb^2-R12*R22*X21^2-R21*R22*X12^2+(2*R11*R21+2*R11*R12)*R22^2+(-2*R12*R21^2-2*R12^2*R21)*R22)/(R21*
% sqrt(-4*R11*R22*Xb^2+R12^2*X21^2-4*R11*R22*X12*X21+2*R12*R21*X12*X21+R21^2*X12^2-4*R11^2*R22^2+4*R11*R12*R21*R22)+R12*
% sqrt(-4*R11*R22*Xb^2+R12^2*X21^2-4*R11*R22*X12*X21+2*R12*R21*X12*X21+R21^2*X12^2-4*R11^2*R22^2+4*R11*R12*R21*R22)+(2*R11*R22-R12*R21-R12^2)*X21+
% (2*R11*R22-R21^2-R12*R21)*X12)

% Xc3 = -(sqrt(-4*R11*R22*Xb^2+R12^2*X21^2+(2*R12*R21-4*R11*R22)*X12*X21+R21^2*X12^2-4*R11^2*R22^2+4*R11*R12*R21*R22)-R12*X21-R21*X12+2*R22*X11)/(2*R22)

% Xa4 = -(X21*(R22*sqrt(-4*R11*R22*Xb^2+R12^2*X21^2-4*R11*R22*X12*X21+2*R12*R21*X12*X21+R21^2*X12^2-4*R11^2*R22^2+4*R11*R12*R21*R22)+(R21+R12)*R22*X12)
% +X22*(-R21*sqrt(-4*R11*R22*Xb^2+R12^2*X21^2-4*R11*R22*X12*X21+2*R12*R21*X12*X21+R21^2*X12^2-4*R11^2*R22^2+4*R11*R12*R21*R22)-R12*
% sqrt(-4*R11*R22*Xb^2+R12^2*X21^2-4*R11*R22*X12*X21+2*R12*R21*X12*X21+R21^2*X12^2-4*R11^2*R22^2+4*R11*R12*R21*R22)+(2*R11*R22-R12*R21-R12^2)*X21+
% (2*R11*R22-R21^2-R12*R21)*X12)+R22*X12*sqrt(-4*R11*R22*Xb^2+R12^2*X21^2-4*R11*R22*X12*X21+2*R12*R21*X12*X21+R21^2*X12^2-4*R11^2*R22^2+4*R11*R12*R21*R22)+
% (2*R21+2*R12)*R22*Xb^2-R12*R22*X21^2-R21*R22*X12^2+(2*R11*R21+2*R11*R12)*R22^2+(-2*R12*R21^2-2*R12^2*R21)*R22)/(-R21*
% sqrt(-4*R11*R22*Xb^2+R12^2*X21^2-4*R11*R22*X12*X21+2*R12*R21*X12*X21+R21^2*X12^2-4*R11^2*R22^2+4*R11*R12*R21*R22)-R12*
% sqrt(-4*R11*R22*Xb^2+R12^2*X21^2-4*R11*R22*X12*X21+2*R12*R21*X12*X21+R21^2*X12^2-4*R11^2*R22^2+4*R11*R12*R21*R22)+(2*R11*R22-R12*R21-R12^2)*X21+
% (2*R11*R22-R21^2-R12*R21)*X12)

% Xc4 = (sqrt(-4*R11*R22*Xb^2+R12^2*X21^2+(2*R12*R21-4*R11*R22)*X12*X21+R21^2*X12^2-4*R11^2*R22^2+4*R11*R12*R21*R22)+R12*X21+R21*X12-2*R22*X11)/(2*R22)

Zr1 = i*[[Xa1 Xb]; [Xb Xc1]];
Zr2 = i*[[Xa2 Xb]; [Xb Xc2]];
% Zr3 = i*[[Xa3 Xb]; [Xb Xc3]];
% Zr4 = i*[[Xa4 Xb]; [Xb Xc4]];

end