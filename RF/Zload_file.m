% function resp = Zload_file(filename)
% 
% Reads a LT-spice text file and produces a 
% frequency response (resp) structure:
%  
%    resp{1} = freqs    (array of frequencies)
%    resp{2} = Zmat     (Z tensor)
%
function resp = Zload_file(filename)
	fid = fopen(filename,'r');
	ind = textscan(fid,'%f %f,%f %f,%f %f,%f %f,%f','HeaderLines',1);
	
	freqs = ind{1};
	Z11 = ind{2} + i*ind{3};
	Z12 = ind{4} + i*ind{5};
	Z21 = ind{6} + i*ind{7};
	Z22 = ind{8} + i*ind{9};
	
	F = size(freqs)(1);
	Zmat = zeros(2*F,2);
	
	for k=[1:F]
		Zmat(1+2*(k-1),1) = Z11(k);
		Zmat(1+2*(k-1),2) = Z12(k);
		Zmat(2+2*(k-1),1) = Z21(k);
		Zmat(2+2*(k-1),2) = Z22(k);
	end

	resp{1} = freqs;
	resp{2} = Zmat;
end