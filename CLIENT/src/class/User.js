export default class User {

  constructor(data) {
    this.id = data?.id
    this.username = data?.username      
    this.email = data?.email    
    this.owner = data?.owner        
    this.admin = data?.is_admin
    this.roles = data?.roles
    this.permissions = data?.permissions
    this.photo_path = data?.photo_path
  }

  can(action, subject) {
    const checks = []

    if (typeof action === 'string' && action) checks.push(action)
    if (typeof subject === 'string' && subject) checks.push(subject)

    if (typeof action === 'string' && typeof subject === 'string' && action && subject) {
      checks.push(`${action} ${subject}`)
      checks.push(`${subject} ${action}`)
    }

    return (this.permissions || []).some(element => {
      const permissionName = typeof element === 'string' ? element : element?.name

      return checks.includes(permissionName)
    })
  }

  isOwner() {
    if(this.owner) {
      return true
    }
    
    return false
  }

  isAdmin() {
    if(this.admin) {
      return true
    } 
    
    return false
  }
        
}
