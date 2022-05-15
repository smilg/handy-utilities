import asyncio, pickle
from kasa import Discover
from tqdm import tqdm

SEARCH_ADDRESS = "192.168.86.255"

async def main():
    print(f"Discovering devices on {SEARCH_ADDRESS}...")
    devices = await Discover.discover(target=SEARCH_ADDRESS)
    print(f"Found {len(devices)} devices...")
    device_dict = {}
    for addr, dev in tqdm(devices.items(), desc="Obtaining device info"):
        await dev.update()
        device_dict[dev.alias] = addr
    
    print("Done! Pickling device dict as 'kasa_devices.pkl'.")
    with open('kasa_devices.pkl', 'wb') as f:
        pickle.dump(device_dict, f)


if __name__ == "__main__":
    asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())
    device_dict = asyncio.run(main())
