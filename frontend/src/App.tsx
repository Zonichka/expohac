import { Route, Routes, useNavigate } from 'react-router-dom'
import './App.css'
import { AnalyticsPage, AuthPage, LeadsPage, LoginPage, MainPage, SalesPage } from './pages'
import { observer } from 'mobx-react-lite'
import userStore from './store/userStore'
import { AuthLayout, Layout } from './shared/components'
import { useEffect } from 'react'
import ProfilePage from './pages/ProfilePage/ProfilePage'
import { GetUser } from './lib/api/userApi'

const App = observer(() => {
  
  const nav = useNavigate()

  useEffect(() => {
    const token = localStorage.getItem("jwt")
    if (!token) return
    GetUser(token)
  }, [])

  useEffect(() => {
    userStore.user.login === "" ? nav("/auth") : nav("/")
  }, [userStore.user])


  if (userStore.user.login === ""){
    return(
      <>
      <AuthLayout>
        <Routes>
          <Route path='/auth' element={<AuthPage/>}  />
          <Route path='/login' element={<LoginPage/>}  />
        </Routes>
      </AuthLayout>
      </>
    )
  }
  
  return (
    <>
    <Layout>
      <Routes>
        <Route path='/' element={<MainPage />} />
        <Route path='/leads' element={<LeadsPage />} />
        <Route path='/sales' element={<SalesPage />} />
        <Route path='/analytics' element={<AnalyticsPage />} />
        <Route path='/profile' element={<ProfilePage />} />
      </Routes>
    </Layout>
    </>
  )
})

export default App
