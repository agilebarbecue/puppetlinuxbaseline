import wave
import struct
import binascii

if __name__ == '__main__':

    o_fn=r"out.wav"
    i_fn=r"in.cab"

    outfile = wave.open(o_fn, 'w')
    outfile.setparams((2, 4, 48000, 0, 'NONE', 'not compressed'))
    sample_32bit=[]
    with open(i_fn,'r') as infile:
	# first 2048 hex values are samples
	sample_hex=[l[2:10] for l in infile.readlines() if l.startswith('0x')]
	sample_float=[]
	for n in range(0,1024):
	    sample_float.append(struct.unpack('>f', binascii.unhexlify(sample_hex[n]))[0])
	    sample_float.append(struct.unpack('>f', binascii.unhexlify(sample_hex[n+1024]))[0])
	sample_32bit = [struct.pack('l',int((2**31 - 1) * s )) for s in sample_float]
    sample_str=b''.join(sample_32bit)
    outfile.writeframes(sample_str)
    outfile.close()
