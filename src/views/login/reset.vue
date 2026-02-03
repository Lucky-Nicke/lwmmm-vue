<template>
  <div class="login-container">
    <el-form
      ref="resetForm"
      :model="resetForm"
      :rules="resetRules"
      class="login-form"
      auto-complete="on"
      label-position="left"
    >
      <div class="title-container">
        <h3 class="title">重置密码</h3>
      </div>

      <!-- 1. 用户名 -->
      <el-form-item prop="username">
        <span class="svg-container">
          <svg-icon icon-class="user" />
        </span>
        <el-input
          ref="username"
          v-model="resetForm.username"
          placeholder="用户名"
          name="username"
          type="text"
          tabindex="1"
          auto-complete="on"
        />
      </el-form-item>

      <!-- 2. 旧密码 (使用 passwordTypeOld) -->
      <el-form-item prop="oldPassword">
        <span class="svg-container">
          <svg-icon icon-class="password" />
        </span>
        <el-input
          :key="passwordTypeOld"
          ref="oldPassword"
          v-model="resetForm.oldPassword"
          :type="passwordTypeOld"
          placeholder="旧密码"
          name="oldPassword"
          tabindex="2"
          auto-complete="on"
        />
        <!-- 传递参数 'old' -->
        <span class="show-pwd" @click="showPwd('old')">
          <svg-icon
            :icon-class="passwordTypeOld === 'password' ? 'eye' : 'eye-open'"
          />
        </span>
      </el-form-item>

      <!-- 3. 新密码 (使用 passwordTypeNew) -->
      <el-form-item prop="newPassword">
        <span class="svg-container">
          <svg-icon icon-class="password" />
        </span>
        <el-input
          :key="passwordTypeNew"
          ref="newPassword"
          v-model="resetForm.newPassword"
          :type="passwordTypeNew"
          placeholder="新密码"
          name="newPassword"
          tabindex="3"
          auto-complete="off"
        />
        <!-- 传递参数 'new' -->
        <span class="show-pwd" @click="showPwd('new')">
          <svg-icon
            :icon-class="passwordTypeNew === 'password' ? 'eye' : 'eye-open'"
          />
        </span>
      </el-form-item>

      <!-- 4. 确认新密码 (使用 passwordTypeConfirm) -->
      <el-form-item prop="confirmPassword">
        <span class="svg-container">
          <svg-icon icon-class="password" />
        </span>
        <el-input
          :key="passwordTypeConfirm"
          ref="confirmPassword"
          v-model="resetForm.confirmPassword"
          :type="passwordTypeConfirm"
          placeholder="确认新密码"
          name="confirmPassword"
          tabindex="4"
          auto-complete="off"
          @keyup.enter.native="handleReset"
        />
        <!-- 传递参数 'confirm' -->
        <span class="show-pwd" @click="showPwd('confirm')">
          <svg-icon
            :icon-class="passwordTypeConfirm === 'password' ? 'eye' : 'eye-open'"
          />
        </span>
      </el-form-item>

      <el-button
        :loading="loading"
        type="primary"
        style="width: 100%; margin-bottom: 20px"
        @click.native.prevent="handleReset"
        >确认修改</el-button
      >

      <!-- 返回登录链接 -->
      <div class="tips">
        <router-link to="/login" class="back-login">
          <i class="el-icon-back" /> 返回登录
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
// 1. 直接引入 request 工具，跳过 api/user.js
import request from "@/utils/request";

export default {
  name: "ResetPassword",
  data() {
    const validateRequired = (rule, value, callback) => {
      if (!value) {
        callback(new Error("该项不能为空"));
      } else {
        callback();
      }
    };
    const validateConfirmPassword = (rule, value, callback) => {
      if (!value) {
        callback(new Error("请再次输入新密码"));
      } else if (value !== this.resetForm.newPassword) {
        callback(new Error("两次输入的密码不一致!"));
      } else {
        callback();
      }
    };

    return {
      resetForm: {
        username: "",
        oldPassword: "",
        newPassword: "",
        confirmPassword: "",
      },
      resetRules: {
        username: [
          { required: true, trigger: "blur", validator: validateRequired },
        ],
        oldPassword: [
          { required: true, trigger: "blur", validator: validateRequired },
        ],
        newPassword: [
          { required: true, trigger: "blur", validator: validateRequired },
          { min: 6, message: "密码长度不能少于6位", trigger: "blur" },
        ],
        confirmPassword: [
          {
            required: true,
            trigger: "blur",
            validator: validateConfirmPassword,
          },
        ],
      },
      loading: false,
      passwordTypeOld: 'password',
      passwordTypeNew: 'password',
      passwordTypeConfirm: 'password'
    };
  },
  methods: {
     showPwd(type) {
      if (type === 'old') {
        this.passwordTypeOld = this.passwordTypeOld === 'password' ? '' : 'password'
        this.$nextTick(() => { this.$refs.oldPassword.focus() })
      } else if (type === 'new') {
        this.passwordTypeNew = this.passwordTypeNew === 'password' ? '' : 'password'
        this.$nextTick(() => { this.$refs.newPassword.focus() })
      } else if (type === 'confirm') {
        this.passwordTypeConfirm = this.passwordTypeConfirm === 'password' ? '' : 'password'
        this.$nextTick(() => { this.$refs.confirmPassword.focus() })
      }
    },

    // --- 核心修改在这里 ---
    handleReset() {
      console.log("按钮点击成功！开始校验...");

      this.$refs.resetForm.validate((valid) => {
        if (valid) {
          console.log("校验通过，准备发送请求...");
          this.loading = true;

          const queryParams = {
            username: this.resetForm.username,
            oldPwd: this.resetForm.oldPassword,
            newPwd: this.resetForm.newPassword,
          };

          // 2. 直接在这里发起请求，不再引用外部文件
          // 这样能 100% 避开 export/import 的兼容性问题
          request({
            url: "/admin/system/index/changePwd",
            method: "post",
            data: queryParams,
          })
            .then((response) => {
              console.log("接口返回成功:", response);
              this.loading = false;

              // 根据你的后端返回结构判断
              if (response.code === 200) {
                this.$message.success(
                  response.message || "密码修改成功，请重新登录"
                );
                setTimeout(() => {
                  this.$router.push("/login");
                }, 1500);
              } else {
                this.$message.error(response.message || "修改失败");
              }
            })
            .catch((error) => {
              console.error("接口请求失败:", error);
              this.loading = false;
            });
        } else {
          console.log("前端校验未通过");
          return false;
        }
      });
    },
  },
};
</script>

<style lang="scss">
/* --- 核心修复：Global CSS (必须保留，保证输入框一行显示) --- */
$cursor: #fff;
$input_bg: transparent;

@supports (-webkit-mask: none) and (not (cater-color: $cursor)) {
  .login-container .el-input input {
    color: $cursor;
  }
}

/* reset element-ui css */
.login-container {
  .el-input {
    flex: 1;
    width: auto;

    input {
      background: $input_bg;
      border: 0px;
      -webkit-appearance: none;
      border-radius: 0px;
      padding: 12px 5px 12px 5px;
      color: $cursor;
      height: 47px;
      caret-color: $cursor;

      &:-webkit-autofill {
        box-shadow: 0 0 0px 1000px rgba(0, 0, 0, 0.2) inset !important;
        -webkit-text-fill-color: $cursor !important;
        transition: background-color 50000s ease-in-out 0s;
      }
    }
  }

  .el-form-item {
    border: 1px solid rgba(255, 255, 255, 0.1);
    background: rgba(0, 0, 0, 0.2);
    border-radius: 5px;
    color: #454545;

    .el-form-item__content {
      display: flex !important;
      align-items: center !important;
      width: 100%;
      line-height: 47px;
      position: relative;
    }
  }
}
</style>

<style lang="scss" scoped>
/* --- 页面样式 (复用之前的 Login 样式) --- */
$bg: #2d3a4b;
$dark_gray: #889aa4;
$light_gray: #eee;

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
  position: relative; // 为了给 footer 做定位参考

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
    text-align: right; // 链接靠右

    .back-login {
      color: #fff;
      text-decoration: none;
      font-weight: 500;
      transition: color 0.3s;

      &:hover {
        color: #00d2ff;
      }
    }
  }

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

  .svg-container {
    padding: 0 15px;
    color: $dark_gray;
    vertical-align: middle;
    width: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .title-container {
    position: relative;
    .title {
      font-size: 26px; // 字号稍微调小一点点
      color: #fff;
      margin: 0px auto 30px auto;
      text-align: center;
      font-weight: 600;
      letter-spacing: 2px;
      text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
    }
  }

  .show-pwd {
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    font-size: 16px;
    color: $dark_gray;
    cursor: pointer;
    user-select: none;
    height: 100%;
    display: flex;
    align-items: center;
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
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    }
  }
}
</style>