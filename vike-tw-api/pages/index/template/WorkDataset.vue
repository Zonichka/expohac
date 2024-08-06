<template>
  <h1 class="font-bold text-3xl pb-4">Dataset work</h1>
  <label>Data Csv</label><br/>
  <textarea v-model="dataCsv"></textarea><br/>
  <label>Data Json</label><br/>
  <textarea v-model="printJson"></textarea><br/>  
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { fakerRU as faker } from '@faker-js/faker';

let fakes = {}
const dataCsv = ref(null)
const dataJson = ref({"data":[]})
const printJson = ref(null)
const result = []
const resultJson = []
const headerCsv = {
  'id': 'userId',
// person user
  'bio': 'Теги',
  'fullName': 'ФИО',
  'firstName': 'Имя',
  'middleName': 'Отчество',
  'birthdate': 'Дата рождения',
  'age': 'Возраст',
  'email': 'Email',
  'phone': 'Телефон',
  'sex': 'Пол',
  'sexType': 'Тип пола',
  'country': 'Страна',   
  'city': 'Город', 
  'streetAddress': 'Адрес',  
// social
  'countChild': 'Кол. детей',   
  'countCar': 'Кол. машин', 
  'countHouse': 'Кол. домов', 
  'hasMarriage': 'Семейное положение', // boolean
  'socialStatus': 'Соц.статус', // [1...3]  Студент/работающий/безработный
  'lastBuy': 'Последние услуги Экспобанк', // [0...3]   
// person  
  'jobArea': 'Область работы',
  'jobDescriptor': 'Описание работы',
  'jobType': 'Вид работы',
  'jobTitle': 'Должность',
// commerce  
  'department': 'Отдел',
  'isbn': 'Артикул',
  'price': 'Цена',
  'product': 'Продукт',
  'productAdjective': 'Параметр',
  //'productDescription': faker.commerce.productDescription(),
  'productMaterial': 'Материал',
  'productName': 'Продукт название',
}
//let str = ''
let header = []
  for(const key in headerCsv){
    //str += `${key}: ${fakes[key]}`
	header.push(headerCsv[key])
  }
result.push(header.join(';'))

for (let i=0; i<10; i++){
  fakes.id = faker.number.int(100000)
  fakes.bio = faker.person.bio()
  //'prefix': faker.person.prefix(),
  //'suffix': faker.person.suffix(),
  fakes.fullName = faker.person.fullName()
  fakes.firstName = faker.person.firstName()
  fakes.middleName = faker.person.middleName()
  fakes.birthdate = faker.date.birthdate({ min: 14, max: 65, mode: 'age' })
  fakes.age = faker.number.int({ min: 14, max: 65 })
  fakes.email = faker.internet.email()
  fakes.phone = faker.phone.number()
  fakes.sex = faker.person.sex()
  fakes.sexType = faker.person.sexType()
  fakes.country = faker.location.country()
  fakes.city = faker.location.city()
  fakes.streetAddress = faker.location.streetAddress()
  
  fakes.countChild = faker.number.int({ min: 0, max: 5 })   
  fakes.countCar = faker.number.int({ min: 0, max: 5 }) 
  fakes.countHouse = faker.number.int({ min: 0, max: 3 }) 
  fakes.hasMarriage = faker.number.int({ min: 0, max: 1 }) 
  fakes.socialStatus = faker.number.int({ min: 1, max: 3 }) 
  fakes.lastBuy = faker.number.int({ min: 0, max: 3 })
  
  fakes.jobArea = faker.person.jobArea()
  fakes.jobDescriptor = faker.person.jobDescriptor()
  fakes.jobType = faker.person.jobType()
  fakes.jobTitle = faker.person.jobTitle()
  fakes.department = faker.commerce.department()
  fakes.articul = faker.commerce.isbn()
  fakes.price = faker.commerce.price()
  fakes.product = faker.commerce.product()
  fakes.productAdjective = faker.commerce.productAdjective()
  //fakes.productDescription = faker.commerce.productDescription(),
  fakes.productMaterial = faker.commerce.productMaterial()
  fakes.productName = faker.commerce.productName()

  const item = []
  const itemJson = {}
  for(const key in fakes){
	item.push(fakes[key])
	itemJson[key] = fakes[key]
  }
  result.push(item.join(';'))
  resultJson.push(itemJson)
  console.log('data',item.join(';'))
}
  console.log('data',result)
  dataCsv.value = result.join("\n")
  dataJson.value.data = resultJson
  printJson.value = JSON.stringify(dataJson.value)
//console.log('data',fakes)
</script>
<style scope>
textarea{
  width:100vw;
  height: 50vh;
}
</style>
