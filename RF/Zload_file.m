function ind = Zload_file(name)
	fid = fopen(name,'r')
	ind = textscan(fid,'%f %f,%f %f,%f %f,%f %f,%f','HeaderLines',1)
	size(ind)
end