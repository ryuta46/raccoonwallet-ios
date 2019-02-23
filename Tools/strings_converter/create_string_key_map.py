import xml.etree.ElementTree as ElementTree
import difflib
from typing import Dict, List

from strings_converter import strings_io

IOS_STRING_FILE = "../RaccoonWallet/Resources/ja.lproj/localizable.strings"

ANDROID_STRING_FILE = "strings.xml"
ANDROID_ALTERNATIVE_UNCHECKED = "alternative_unchecked.xml"
ANDROID_ALTERNATIVE_CHECKED = "alternative_checked.xml"
ANDROID_ALTERNATIVE_MANUAL = "alternative_manual.xml"


ANDROID_EN_STRING_FILE = "strings_en.xml"
IOS_EN_STRING_FILE = "../RaccoonWallet/Resources/en.lproj/localizable.strings"

ANDROID_TH_STRING_FILE = "strings_th.xml"
IOS_TH_STRING_FILE = "../RaccoonWallet/Resources/th.lproj/localizable.strings"

if __name__ == '__main__':
    ios_key_map = strings_io.read_ios_strings(IOS_STRING_FILE)
    android_key_map = strings_io.read_android_strings(ANDROID_STRING_FILE)
    android_key_map.update(strings_io.read_android_strings(ANDROID_ALTERNATIVE_CHECKED))
    # android_key_map.update(read_android_strings(ANDROID_ALTERNATIVE_MANUAL))

    alternative_root = ElementTree.Element('resources')

    no_match_count = 0
    key_conversion: Dict[str, str] = {}
    for ios_key in ios_key_map.keys():
        ios_value = ios_key_map[ios_key]
        match_keys: List[str] = []
        max_match_ratio = 0
        max_match_key = ""
        for android_key in android_key_map.keys():
            android_value = android_key_map[android_key]

            if ios_value == android_value:
                match_keys.append(android_key)
            else:
                match_ratio = difflib.SequenceMatcher(None, ios_value, android_value).ratio()
                if match_ratio > max_match_ratio:
                    max_match_key = android_key
                    max_match_ratio = match_ratio

        if len(match_keys) == 0:
            print(f'No match key: {ios_key} {ios_value}')
            no_match_count += 1
            if len(max_match_key) > 0:
                new_string = ElementTree.SubElement(alternative_root, 'string')
                android_value = android_key_map[max_match_key]
                new_string.attrib['name'] = max_match_key
                new_string.attrib['original'] = android_value
                new_string.text = ios_value

                # print(f'Max match: {max_match_key} {max_match_ratio}\n{ios_value}\n{android_value}')
        elif len(match_keys) == 1:
            key_conversion[ios_key] = match_keys[0]
            # print(f'Only one match key: {ios_key}, {match_keys[0]}')
            pass
        else:
            key_conversion[ios_key] = match_keys[0]
            # print(f'Multiple match key: {ios_key}, {match_keys}')
            pass

    print(f"No match {no_match_count}")
    tree = ElementTree.ElementTree(alternative_root)
    tree.write(ANDROID_ALTERNATIVE_UNCHECKED, encoding='utf-8')

    strings_io.convert_ios_strings(
        src_file_name=IOS_STRING_FILE,
        dst_file_name=IOS_TH_STRING_FILE,
        android_file_name=ANDROID_TH_STRING_FILE,
        key_map=key_conversion
    )
