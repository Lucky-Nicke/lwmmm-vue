<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!-- 左侧：用户资料卡片 -->
      <el-col :span="8" :xs="24">
        <el-card class="box-card user-card">
          <div slot="header" class="clearfix">
            <span>个人名片</span>
          </div>
          <div class="user-profile">
            <div class="box-center">
              <el-avatar :size="120" :src="userInfo.avatar" class="user-avatar">
              </el-avatar>
            </div>
            <div class="box-center">
              <div class="user-name text-center">{{ userInfo.name }}</div>
              <div class="user-role text-center text-muted">
                @{{ userInfo.username }}
              </div>
            </div>
          </div>

          <div class="user-info-list">
            <ul class="list-group list-group-striped">
              <li class="list-group-item">
                <i class="el-icon-mobile-phone"></i> 手机号码
                <div class="pull-right">{{ userInfo.phone || "暂无" }}</div>
              </li>
              <li class="list-group-item">
                <i class="el-icon-s-custom"></i> 账号状态
                <div class="pull-right">
                  <el-tag
                    v-if="userInfo.status === 1"
                    size="small"
                    type="success"
                    >正常</el-tag
                  >
                  <el-tag v-else size="small" type="danger">禁用</el-tag>
                </div>
              </li>
              <li class="list-group-item">
                <i class="el-icon-date"></i> 注册时间
                <div class="pull-right">{{ userInfo.creaT }}</div>
              </li>
            </ul>
          </div>

          <div class="user-bio">
            <div class="user-bio-section">
              <div class="user-bio-section-header">
                <i class="el-icon-document"></i><span> 个人简介</span>
              </div>
              <div class="user-bio-section-body">
                <div class="text-muted">
                  {{
                    userInfo.description
                      ? userInfo.description
                      : "这个人很懒，暂时没有留下什么简介..."
                  }}
                </div>
              </div>
            </div>
          </div>
        </el-card>
      </el-col>

      <!-- 右侧：详细信息/修改表单 -->
      <el-col :span="16" :xs="24">
        <el-card>
          <el-tabs v-model="activeTab">
            <el-tab-pane label="基本资料" name="account">
              <el-form
                ref="userForm"
                :model="userInfo"
                label-width="80px"
                size="medium"
              >
                <el-form-item label="用户账号">
                  <el-input v-model="userInfo.username" disabled></el-input>
                </el-form-item>

                <el-form-item label="用户昵称">
                  <el-input v-model="userInfo.name"></el-input>
                </el-form-item>

                <el-form-item label="联系电话">
                  <el-input v-model="userInfo.phone" maxlength="11"></el-input>
                </el-form-item>

                <el-form-item label="个人简介">
                  <el-input
                    type="textarea"
                    v-model="userInfo.description"
                    :rows="4"
                    placeholder="介绍一下你自己吧..."
                  >
                  </el-input>
                </el-form-item>

                <el-form-item label="最后更新">
                  <el-input v-model="userInfo.updT" disabled></el-input>
                </el-form-item>

                <el-form-item>
                  <el-button type="primary" @click="submitUserInfo"
                    >保存修改</el-button
                  >
                  <el-button @click="resetUserInfo">重置</el-button>
                </el-form-item>
              </el-form>
            </el-tab-pane>

            <el-tab-pane label="账号安全" name="security">
              <el-form
                ref="pwdForm"
                :model="passwordForm"
                :rules="passwordRules"
                label-width="100px"
                size="medium"
                style="max-width: 500px; margin-top: 20px"
              >
                <el-form-item label="原密码" prop="oldPwd">
                  <el-input
                    v-model="passwordForm.oldPwd"
                    type="password"
                    show-password
                    placeholder="请输入当前密码"
                  ></el-input>
                </el-form-item>

                <el-form-item label="新密码" prop="newPwd">
                  <el-input
                    v-model="passwordForm.newPwd"
                    type="password"
                    show-password
                    placeholder="请输入新密码"
                  ></el-input>
                </el-form-item>

                <el-form-item label="确认新密码" prop="confirmPassword">
                  <el-input
                    v-model="passwordForm.confirmPassword"
                    type="password"
                    show-password
                    placeholder="请再次输入新密码"
                  ></el-input>
                </el-form-item>

                <el-form-item>
                  <el-button type="danger" @click="submitPasswordForm"
                    >修改密码</el-button
                  >
                  <el-button @click="resetPasswordForm">清空</el-button>
                </el-form-item>
              </el-form>
            </el-tab-pane>
          </el-tabs>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>
  
  <script>
import { mapGetters } from "vuex";
// 导入你提供的 API 接口
import { getLessInfo, resetPassword } from "@/api/user";
import userApi from "@/api/user/user";

export default {
  name: "Profile",
  data() {
    const validateConfirmPassword = (rule, value, callback) => {
      if (value === "") {
        callback(new Error("请再次输入新密码"));
      } else if (value !== this.passwordForm.newPwd) {
        callback(new Error("两次输入的密码不一致!"));
      } else {
        callback();
      }
    };

    return {
      activeTab: "account",

      userInfo: {
        id: null,
        username: "",
        name: "",
        phone: "",
        avatar: "",
        description: "",
        status: 1,
        creaT: "",
        updT: "",
      },
      originalUserInfo: {},

      passwordForm: {
        oldPwd: "",
        newPwd: "",
        confirmPassword: "",
      },
      passwordRules: {
        oldPwd: [
          { required: true, message: "请输入原密码", trigger: "blur" },
        ],
        newPwd: [
          { required: true, message: "请输入新密码", trigger: "blur" },
          {
            min: 6,
            max: 20,
            message: "长度在 6 到 20 个字符",
            trigger: "blur",
          },
        ],
        confirmPassword: [
          {
            required: true,
            validator: validateConfirmPassword,
            trigger: "blur",
          },
        ],
      },
    };
  },
  computed: {
    // 从 vuex 中获取 token，供 getInfo 接口使用
    ...mapGetters(["token"]),
  },
  created() {
    this.fetchUserInfo();
  },
  methods: {
    // 1. 获取用户信息
    fetchUserInfo() {
      // 传入 vuex 中的 token
      getLessInfo(this.token)
        .then((res) => {
          if (res.code === 200) {
            this.userInfo = res.data;
            this.originalUserInfo = { ...res.data };
          } else {
            this.$message.error(res.message || "获取用户信息失败");
          }
        })
        .catch((err) => {
          console.error(err);
        });
    },

    // 2. 保存基本信息
    submitUserInfo() {
      // 在前面加上 userApi.
      userApi
        .updateUser(this.userInfo)
        .then((res) => {
          if (res.code === 200) {
            this.$message.success("个人资料保存成功！");
            this.fetchUserInfo();
          } else {
            this.$message.error(res.message || "保存失败");
          }
        })
        .catch((err) => {
          console.error(err);
        });
    },

    // 重置基本信息
    resetUserInfo() {
      this.userInfo = { ...this.originalUserInfo };
      this.$message.info("已重置为初始信息");
    },

    // 3. 提交修改密码
    submitPasswordForm() {
      this.$refs.pwdForm.validate((valid) => {
        if (valid) {
          // 构造后端需要的参数对象，加入 username
          const pwdData = {
            username: this.userInfo.username, // <--- 新增了这行
            oldPwd: this.passwordForm.oldPwd,
            newPwd: this.passwordForm.newPwd,
          };

          resetPassword(pwdData)
            .then((res) => {
              if (res.code === 200 || res.code === 20000) {
                // 兼容不同的成功状态码
                this.$message.success("密码修改成功，请牢记您的新密码！");
                this.resetPasswordForm();

                // 密码修改成功后，通常需要清除 token 并重新登录
                // this.$store.dispatch('user/logout').then(() => {
                //   this.$router.push(`/login`)
                // })
              } else {
                this.$message.error(res.message || "修改密码失败");
              }
            })
            .catch((err) => {
              console.error("修改密码请求错误:", err);
            });
        } else {
          console.log("密码表单校验未通过");
          return false;
        }
      });
    },

    resetPasswordForm() {
      this.$refs.pwdForm.resetFields();
    },
  },
};
</script>
  
  <style scoped>
/* 样式与之前保持一致，这里就不增加冗余代码了 */
.app-container {
  padding: 20px;
}
.box-center {
  margin: 0 auto;
  display: table;
}
.text-muted {
  color: #777;
}
.text-center {
  text-align: center;
}
.user-profile .user-name {
  font-weight: bold;
  font-size: 20px;
  color: #303133;
  margin-top: 15px;
}
.user-profile .user-role {
  padding-top: 5px;
  font-size: 14px;
  margin-bottom: 20px;
}
.user-avatar {
  border: 3px solid #e6ebf5;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
}
.list-group {
  padding-left: 0px;
  list-style: none;
  margin-top: 15px;
}
.list-group-item {
  border-bottom: 1px solid #e7eaec;
  border-top: 1px solid #e7eaec;
  margin-bottom: -1px;
  padding: 15px 0px;
  font-size: 14px;
  color: #606266;
}
.list-group-item i {
  margin-right: 5px;
  color: #909399;
}
.pull-right {
  float: right;
  color: #303133;
}
.user-bio {
  margin-top: 20px;
  color: #606266;
}
.user-bio-section-header {
  border-bottom: 1px solid #dfe6ec;
  padding-bottom: 10px;
  margin-bottom: 10px;
  font-weight: bold;
  font-size: 15px;
}
.user-bio-section-body {
  font-size: 13px;
  line-height: 1.6;
}
</style>