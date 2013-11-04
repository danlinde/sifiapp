window.notify = (title, message, token)->
  
  # Check for notification compatibility.
  
  # If the browser version is unsupported, remain silent.
  return  if not "Notification" of window
  
  # Log current permission level
  console.log Notification.permission
  
  # If the user has not been asked to grant or deny notifications
  # from this domain...
  if Notification.permission is "default"
    Notification.requestPermission ->
      
      # ...callback this function once a permission level has been set.
      notify()

  
  # If the user has granted permission for this domain to send notifications...
  else if Notification.permission is "granted"
    n = new Notification(title,
      body: message
      
      # ...prevent duplicate notifications
      tag: token
    )
    
    # Remove the notification from Notification Center when clicked.
    n.onclick = ->
      @close()

    
    # Callback function when the notification is closed.
    n.onclose = ->
      console.log "Notification closed"
  
  # If the user does not want notifications to come from this domain...
  
  # ...remain silent.
  else return  if Notification.permission is "denied"