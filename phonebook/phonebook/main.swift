//
//  main.swift
//  phonebook
//
//  Created by JIWOONG on 2024/01/01.
//

import Foundation

class Person {
    var name = String()
    var age = String()
    var phone = String()
}

print("1) 연락처 추가 2) 연락처 목록보기 3) 연락처 검색 x) 종료")
print("메뉴를 선택해주세요 :")
let menuNum: String? = readLine()

if let menu = menuNum {
    switch menu {
        case "1" : addContact()
        case "x" : print("[프로그램 종료]")
        default : print("선택이 잘못되었습니다 확인 후 다시 입력해주세요.")
    }
}

func addContact() {
    //추가하기
    print("연락처 정보를 입력해주세요 : ")
    let inputMember: String? = readLine()

    if var strMember = inputMember {
        if strMember.isEmpty {
            print("아무것도 입력되지 않았습니다. 입력 형식을 확인해주세요.")
        } else {
            strMember = strMember.components(separatedBy: [" "]).joined()
            let arrMember: Array<String> = strMember.components(separatedBy: "/")
            let nameRule: String = "^[a-z]*$"
            let ageRule: String = "^[0-9]*$"
            let PhoneNumRule: String = "^0([0-9]{1,2})-([0-9]{3,4})-([0-9]{4})$"
            
            let nameChecker = arrMember[0].range(of: nameRule, options: .regularExpression) != nil
            let ageChecker = arrMember[1].range(of: ageRule, options: .regularExpression) != nil
            let countedAge = arrMember[1].count
            let phoneNumChecker = arrMember[2].range(of: PhoneNumRule, options: .regularExpression) != nil
            if nameChecker == false {
                print("입력한 이름 정보가 잘못되었습니다.")
            } else if ageChecker == false || (countedAge < 1 || countedAge > 3) {
                print("입력한 나이정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
            } else if phoneNumChecker == false {
                print("입력한 연락처정보가 잘못되었습니다. 입력 형식을 확인해주세요.")
            } else {
                let somePerson = Person()
                
                somePerson.name = arrMember[0]
                somePerson.age = arrMember[1]
                somePerson.phone = arrMember[2]
                print("입력한 정보는 \(somePerson.age)세 \(somePerson.name)(\(somePerson.phone))입니다.")
            }
        }
    }
}

