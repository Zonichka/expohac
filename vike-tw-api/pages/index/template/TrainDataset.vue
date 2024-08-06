<template>
  <h1 class="font-bold text-3xl pb-4">Dataset train</h1>
  <label>Data Csv</label><br/>
  <textarea v-model="dataCsv"></textarea><br/>
  <label>Data Json</label><br/>
  <textarea v-model="printJson"></textarea><br/>  
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { fakerRU as faker } from '@faker-js/faker';

const dataCsv = ref(null)
const dataJson = ref({"data":[]})
const printJson = ref(null)
let fakes = {}
/*
Пример генерации табличных данных для ИИ
let fakes = {
  'randNumber': faker.string.numeric(10),
// person user
  'bio': faker.person.bio(),
  //'prefix': faker.person.prefix(),
  //'suffix': faker.person.suffix(),
  'fullName': faker.person.fullName(),
  'firstName': faker.person.firstName(),
  'middleName': faker.person.middleName(),
  'birthdate': faker.date.birthdate({ min: 14, max: 65, mode: 'age' }),
  'email': faker.internet.email(),
  'phone': faker.phone.number(),
  'sex': faker.person.sex(),
  'sexType': faker.person.sexType(),
  'country': faker.location.country(),   
  'city': faker.location.city(), 
  'streetAddress': faker.location.streetAddress(),   
// person  
  'jobArea': faker.person.jobArea(),
  'jobDescriptor': faker.person.jobDescriptor(),
  'jobType': faker.person.jobType(),
  'jobTitle': faker.person.jobTitle(),
// commerce  
  'department': faker.commerce.department(),
  'isbn': faker.commerce.isbn(),
  'price': faker.commerce.price(),
  'product': faker.commerce.product(),
  'productAdjective': faker.commerce.productAdjective(),
  //'productDescription': faker.commerce.productDescription(),
  'productMaterial': faker.commerce.productMaterial(),
  'productName': faker.commerce.productName(),
}
*/
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
  'email': 'Email',
  'phone': 'Телефон',
  'sex': 'Пол',
  'sexType': 'Тип пола',
  'country': 'Страна',   
  'city': 'Город', 
  'streetAddress': 'Адрес',   
// person  
  'jobArea': 'Область работы',
  'jobDescriptor': 'Описание работы',
  'jobType': 'Вид работы',
  'jobTitle': 'Должность',
// commerce  
  'department': 'Отдел',
  'isbn': 'Исбн',
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
  fakes.email = faker.internet.email()
  fakes.phone = faker.phone.number()
  fakes.sex = faker.person.sex()
  fakes.sexType = faker.person.sexType()
  fakes.country = faker.location.country()
  fakes.city = faker.location.city()
  fakes.streetAddress = faker.location.streetAddress()
  fakes.jobArea = faker.person.jobArea()
  fakes.jobDescriptor = faker.person.jobDescriptor()
  fakes.jobType = faker.person.jobType()
  fakes.jobTitle = faker.person.jobTitle()
  fakes.department = faker.commerce.department()
  fakes.isbn = faker.commerce.isbn()
  fakes.price = faker.commerce.price()
  fakes.product = faker.commerce.product()
  fakes.productAdjective = faker.commerce.productAdjective()
  //fakes.productDescription = faker.commerce.productDescription(),
  fakes.productMaterial = faker.commerce.productMaterial()
  fakes.productName = faker.commerce.productName()

  const item = []
  const itemJson = {}
  for(const key in fakes){
    //str += `${key}: ${fakes[key]}`
	item.push(fakes[key])
	itemJson[key] = fakes[key]
  }
  result.push(item.join(';'))
  resultJson.push(itemJson)
  console.log('data',item.join(';'))
  //str = ''
}

  //fakes.forEach((key, val) => {
    //console.log('data',key,val)
	//str += `${key} : ${val}`
  //}) 
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
