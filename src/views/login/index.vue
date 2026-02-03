<template>
  <div class="login-container">
    <el-form ref="loginForm" :model="loginForm" :rules="loginRules" class="login-form" auto-complete="on" label-position="left">

      <div class="title-container">
        <h3 class="title">影视管理系统后台</h3>
      </div>

      <el-form-item prop="username">
        <span class="svg-container">
          <svg-icon icon-class="user" />
        </span>
        <el-input
          ref="username"
          v-model="loginForm.username"
          placeholder="Username"
          name="username"
          type="text"
          tabindex="1"
          auto-complete="on"
        />
      </el-form-item>

      <el-form-item prop="password">
        <span class="svg-container">
          <svg-icon icon-class="password" />
        </span>
        <el-input
          :key="passwordType"
          ref="password"
          v-model="loginForm.password"
          :type="passwordType"
          placeholder="Password"
          name="password"
          tabindex="2"
          auto-complete="on"
          @keyup.enter.native="handleLogin"
        />
        <span class="show-pwd" @click="showPwd">
          <svg-icon :icon-class="passwordType === 'password' ? 'eye' : 'eye-open'" />
        </span>
      </el-form-item>

      <el-button :loading="loading" type="primary" style="width:100%;margin-bottom:20px;" @click.native.prevent="handleLogin">Login</el-button>

      <div class="tips" style="text-align: right; margin-top: 10px;">
        <!-- 使用 router-link 进行跳转 -->
        <router-link to="/reset-password" style="color: #eee; cursor: pointer;">
          <span style="border-bottom: 1px solid #999;">忘记密码?</span>
        </router-link>
      </div>

    </el-form>

    <!-- 版权脚注 -->
    <div class="footer">
      <p>Copyright © 2026 Lucky_Nicke All Rights Reserved.</p>
    </div>
  </div>
</template>

<script>
import { validUsername } from '@/utils/validate'

export default {
  name: 'Login',
  data() {
    const validateUsername = (rule, value, callback) => {
      if (!validUsername(value)) {
        callback()
      } else {
        callback()
      }
    }
    const validatePassword = (rule, value, callback) => {
      if (value.length < 6) {
        callback(new Error('密码长度不能少于6位'))
      } else {
        callback()
      }
    }
    return {
      loginForm: {
        username: 'admin',
        password: '111111'
      },
      loginRules: {
        username: [{ required: true, trigger: 'blur', validator: validateUsername }],
        password: [{ required: true, trigger: 'blur', validator: validatePassword }]
      },
      loading: false,
      passwordType: 'password',
      redirect: undefined
    }
  },
  watch: {
    $route: {
      handler: function(route) {
        this.redirect = route.query && route.query.redirect
      },
      immediate: true
    }
  },
  methods: {
    showPwd() {
      if (this.passwordType === 'password') {
        this.passwordType = ''
      } else {
        this.passwordType = 'password'
      }
      this.$nextTick(() => {
        this.$refs.password.focus()
      })
    },
    handleLogin() {
      this.$refs.loginForm.validate(valid => {
        if (valid) {
          this.loading = true
          this.$store.dispatch('user/login', this.loginForm).then(() => {
            this.$router.push({ path: this.redirect || '/' })
            this.loading = false
          }).catch(() => {
            this.loading = false
          })
        } else {
          console.log('error submit!!')
          return false
        }
      })
    }
  }
}
</script>

<style lang="scss">
/* --- 核心修复：Global CSS --- */

$cursor: #fff;
$input_bg: transparent; 

@supports (-webkit-mask: none) and (not (cater-color: $cursor)) {
  .login-container .el-input input {
    color: $cursor;
  }
}

/* reset element-ui css */
.login-container {
  // 1. 设置 el-input 宽度占满剩余空间
  .el-input {
    flex: 1; // 关键：让输入框自动填满除去图标外的剩余宽度
    width: auto; // 重置掉原来的固定宽度或百分比
    
    input {
      background: $input_bg;
      border: 0px;
      -webkit-appearance: none;
      border-radius: 0px;
      padding: 12px 5px 12px 5px; // 稍微调整padding
      color: $cursor;
      height: 47px;
      caret-color: $cursor;

      &:-webkit-autofill {
        box-shadow: 0 0 0px 1000px rgba(0,0,0,0.2) inset !important; 
        -webkit-text-fill-color: $cursor !important;
        transition: background-color 50000s ease-in-out 0s; 
      }
    }
  }

  // 2. 核心布局修复：强制同行显示
  .el-form-item {
    border: 1px solid rgba(255, 255, 255, 0.1);
    background: rgba(0, 0, 0, 0.2);
    border-radius: 5px;
    color: #454545;
    
    // 使用 Element UI 的深度选择器强制内容区 Flex 布局
    .el-form-item__content {
      display: flex !important;
      align-items: center !important; // 垂直居中
      width: 100%;
      line-height: 47px; // 保持行高一致
      position: relative;
    }
  }
}
</style>

<style lang="scss" scoped>
/* --- 页面样式优化 --- */

$bg:#2d3a4b;
$dark_gray:#889aa4;
$light_gray:#eee;

// --- 底部版权区域 ---
  .footer {
    position: absolute;
    bottom: 20px;
    width: 100%;
    text-align: center;
    color: rgba(255, 255, 255, 0.6);
    font-size: 15px;
    letter-spacing: 1px;
    
    p {
      margin: 0;
    }
  }

.login-container {
  min-height: 100vh;
  width: 100%;
  
  background-image: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  background-size: cover;
  background-position: center;
  overflow: hidden;
  
  display: flex;
  align-items: center;
  justify-content: center;

  .login-form {
    position: relative;
    width: 450px;
    max-width: 100%;
    
    background: rgba(255, 255, 255, 0.1); 
    backdrop-filter: blur(10px);          
    -webkit-backdrop-filter: blur(10px);  
    border-radius: 16px; 
    border: 1px solid rgba(255, 255, 255, 0.2); 
    box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37); 
    
    padding: 40px 35px;
    margin: 0; 
  }

  .tips {
    font-size: 14px;
    color: #ddd; 
    margin-bottom: 10px;
    text-align: center; 

    span {
      &:first-of-type {
        margin-right: 16px;
      }
    }
  }

  .svg-container {
    padding: 0 15px; // 调整左右间距
    color: $dark_gray;
    vertical-align: middle;
    width: 30px;
    display: flex; // 自身也居中
    align-items: center;
    justify-content: center;
  }

  .title-container {
    position: relative;

    .title {
      font-size: 28px;
      color: #fff;
      margin: 0px auto 30px auto;
      text-align: center;
      font-weight: 600;
      letter-spacing: 2px;
      text-shadow: 0 2px 4px rgba(0,0,0,0.2);
    }
  }

  // 修改眼睛图标位置
  .show-pwd {
    position: absolute;
    right: 10px;
    // top: 7px;  // 删掉 top，用 Flex 下的自动居中或者 transform
    top: 50%;     // 设为 50%
    transform: translateY(-50%); // 向上偏移一半，绝对垂直居中
    font-size: 16px;
    color: $dark_gray;
    cursor: pointer;
    user-select: none;
    height: 100%; // 确保点击区域够大
    display: flex;
    align-items: center; // 内部图标居中
  }
  
  ::v-deep .el-form-item {
    background: rgba(0, 0, 0, 0.2); 
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 8px; 
    margin-bottom: 22px; 
  }

  ::v-deep .el-button--primary {
    background: linear-gradient(90deg, #00d2ff 0%, #3a7bd5 100%); 
    border: none;
    height: 45px;
    font-size: 16px;
    border-radius: 8px;
    transition: all 0.3s;
    
    &:hover {
        transform: scale(1.02); 
        box-shadow: 0 5px 15px rgba(0,0,0,0.3);
    }
  }
}
</style>
