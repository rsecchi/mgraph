function M = series_cap(C, w)

# series_cap(C, w)
#   C: capacitance
#   w: angular frequency (rad/s)
#
#   Returns the transmission matrix of the
#   series capacitor C at frequency w
#

	M = [[1 1/(i*w*C)]; [0 1]];

end

