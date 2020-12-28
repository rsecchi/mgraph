function M = series_ind(L, w)

# series_ind(L, w)
#   L: inductance
#   w: angular frequency (rad/s)
#
#   Returns the transmission matrix of the
#   series inductor L at frequency w
#

	M = [[1 i*w*L]; [0 1]];

end

