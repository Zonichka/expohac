<template>
  <ul>
    <li v-for="item in todoItems" :key="item.text">
      {{ item.text }}
    </li>
    <li>
      <form @submit.prevent="submitNewTodo()">
        <input v-model="newTodo" type="text" />{{ " " }}
        <button type="submit">Add to-do</button>
      </form>
    </li>
  </ul>
</template>

<script lang="ts" setup>
import { client } from "../../ts-rest/client";
import { ref } from "vue";

const props = defineProps<{ initialTodoItems: { text: string }[] }>();
const todoItems = ref(props.initialTodoItems);
const newTodo = ref("");

const submitNewTodo = async () => {
  // Optimistic UI update
  todoItems.value.push({ text: newTodo.value });
  try {
    await client.createTodo({ body: { text: newTodo.value } });
    newTodo.value = "";
  } catch (e) {
    console.error(e);
    // rollback
    todoItems.value.slice(0, -1);
  }
};
</script>
