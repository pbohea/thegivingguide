# Admin Panel Setup

## Making a User an Admin

To grant admin access to a user, open the Rails console and run:

```bash
bin/rails console
```

Then run this command (replace with the actual email):

```ruby
user = User.find_by(email: "your@email.com")
user.update(admin: true)
```

## Accessing the Admin Panel

1. Sign in to your account
2. Click on your email in the top navigation
3. Click "Admin Panel" (shown in green)

## Admin Features

### Posts Management (/admin/gift_guides)
- Create Instagram-style posts with images and captions
- Upload photos and write captions
- Organize posts by position (order in feed)
- Tag posts with occasions
- Delete posts

### Products Management (/admin/products)
- Add products with names, descriptions, prices, and URLs
- Upload product images
- Edit and delete products

### Occasions Management (/admin/occasions)
- Create occasion categories (Birthday, Anniversary, etc.)
- Edit and delete occasions

### View User Submissions
- **Experiences** (/admin/experiences) - View and manage user-submitted gift experiences
- **Consultation Requests** (/admin/consultation_requests) - View consultation form submissions

## Public Pages

- **Home** (/) - Landing page with your logo
- **Posts** (/gift_guides) - Instagram-style feed of your posts
- **Products** (/products) - Product catalog
- **Occasions** (/occasions) - Browse by occasion
- **Experiences** (/experiences) - User-shared gift stories

All admin views are simple, user-friendly forms - no coding required!
