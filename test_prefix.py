import hashlib

alphabet = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"

def get_varint_data(n):
    if n < 128:
        return bytes([n])
    elif n < 16384:
        return bytes([(n >>7) | 0x80, n & 0x7f])
    elif n < 2097152:
        return bytes([(n >>14) | 0x80, ((n >>7) & 0x7f) | 0x80, n & 0x7f])
    else:
        raise ValueError

def base58_encode(data):
    n = int.from_bytes(data, 'big')
    if n == 0:
        return alphabet[0]
    result = ''
    while n > 0:
        n, remainder = divmod(n, 58)
        result = alphabet[remainder] + result
    return result

def encode_addr(tag, data):
    buf = get_varint_data(tag) + data
    hash = hashlib.sha3_256(buf).digest()[:4]
    buf += hash
    return base58_encode(buf)

data = b'\x00' * 64

for tag in [5133]:
    addr = encode_addr(tag, data)
    print(f"tag {tag}: {addr[:10]}")