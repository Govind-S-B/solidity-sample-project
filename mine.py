from hashlib import sha256

def SHA256(text):
	return sha256(text.encode("ascii")).hexdigest()
	
def mine(block_num,transactions,previous_hash,prefix_zero):
	for nonce in range(10000000):
		text_string = str(block_num) + transactions + previous_hash + str(nonce)

		hash_generated = SHA256(text_string)

		if hash_generated.startswith('0'*prefix_zero):
			print(f"Mining / Verification Completed : with nonce {nonce}")
			return SHA256(text_string)

	raise BaseException("couldnt find a nonce to verify")

	
	
if __name__=="__main__":
	transactions ='''
	G -> X : 47
	G -> Y : 34
	'''
	
	difficulty = 2
	new_hash = mine(120,transactions,'0000',difficulty)
	print(new_hash)