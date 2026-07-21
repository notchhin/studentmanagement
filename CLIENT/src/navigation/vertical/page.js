export default [
  { heading: 'Academic' },
  {
    title: 'teachers',
    to: 'teacher',
    icon: { icon: 'mdi-account-tie-outline', size: 15 },
    active: 'teacher',
    permission: 'teacher_list',
  },
  {
    title: 'students',
    to: 'student',
    icon: { icon: 'mdi-account-injury-outline', size: 15 },
    active: 'student',
    permission: 'student_list',
  },
  
  {
    title: 'students_history',
    to: 'students-history',
    icon: { icon: 'mdi-account-injury-outline', size: 15 },
    active: 'studentshistory',
    permission: 'student_history',
  },
  {
    title: 'blacklist',
    to: 'blacklist',
    icon: { icon: 'mdi-account-cancel-outline', size: 15 },
    active: 'blacklist',
    permission: 'blacklist_list',
  },
  
  {
    title: 'level',
    to: 'level',
    icon: { icon: 'mdi-layers-triple-outline', size: 15 },
    active: 'level',

    permission: 'level_list',
  },
  {
    title: 'time1',
    to: 'time',
    icon: { icon: 'mdi-clock-edit-outline', size: 15 },
    active: 'time',
    permission: 'time_list',
  },

  {
    title: 'room',
    to: 'room',
    icon: { icon: 'mdi-google-classroom', size: 15 },
    active: 'room',
    permission: 'room_list',
  },
  {
    title: 'academic_Class',
    to: 'academic-class',
    icon: { icon: 'mdi-calendar-text-outline', size: 15 },
    active: 'academic-class',
    permission: 'academic_class_list',
  },
  {
    title: 'academic_year',
    to: 'academic-year',
    icon: { icon: 'mdi-calendar-edit-outline', size: 15 },
    active: 'academic-year',
    permission: 'academic_year_list',
  },
  { heading: 'settings' },
  {
    title: 'Preference Settings',
    to: 'settings-account-settings',
    icon: { icon: 'mdi-cog-outline', size: 15 },
    active: 'account-settings-outline',
    permission: 'preference_settings',
  },  
  {
    title: 'Users',
    to: 'settings-user-settings',
    icon: { icon: 'tabler-user-cog', size: 13 },
    active: 'users',

    permission: 'view_users',
  },
  {
    title: 'Roles',
    to: 'settings-role-settings',
    icon: { icon: 'tabler-users-group', size: 15 },
    active: 'role',

    permission: 'view_roles',
  },
]
