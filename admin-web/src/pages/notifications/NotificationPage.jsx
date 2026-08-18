import { useState, useRef } from "react";
import { useQuery, useMutation, useQueryClient } from "@tanstack/react-query";
import { notificationApi } from "../../lib/api";
import { formatDate } from "../../lib/utils";
function NotificationPage() {
  const queryClient = useQueryClient();
  const [form, setForm] = useState({
    title: "",
    body: "",
    type: "general",
  });
  const lockRef = useRef(false);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const { data: notificationsData } = useQuery({
    queryKey: ["notifications"],
    queryFn: notificationApi.getAll,
  });
  const notifications = Array.isArray(notificationsData)
    ? notificationsData
    : [];
  const sendMutation = useMutation({
    mutationFn: notificationApi.sendToAll,
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ["notifications"] });
      setForm({ title: "", body: "", type: "general" });
    },
  });
  const handleSubmit = async (e) => {
    e.preventDefault();
    if (lockRef.current || sendMutation.isPending) return;
    lockRef.current = true;
    setIsSubmitting(true);
    try {
      await sendMutation.mutateAsync(form);
    } finally {
      lockRef.current = false;
      setIsSubmitting(false);
    }
  };
  return (
    <div className="p-6 space-y-8">
      <h1 className="text-2xl font-bold">Notifications</h1>
      <form onSubmit={handleSubmit} className="space-y-4 max-w-md">
        <input
          type="text"
          placeholder="Title"
          className="input input-bordered w-full"
          value={form.title}
          disabled={isSubmitting}
          onChange={(e) => setForm({ ...form, title: e.target.value })}
          required
        />
        <textarea
          placeholder="Message"
          className="textarea textarea-bordered w-full"
          value={form.body}
          disabled={isSubmitting}
          onChange={(e) => setForm({ ...form, body: e.target.value })}
          required
        />
        <select
          className="select select-bordered w-full"
          value={form.type}
          disabled={isSubmitting}
          onChange={(e) => setForm({ ...form, type: e.target.value })}
        >
          <option value="general">General</option>
          <option value="order">Order</option>
          <option value="message">Message</option>
          <option value="reminder">Reminder</option>
        </select>
        <button
          type="submit"
          className="btn btn-primary"
          disabled={
            isSubmitting || sendMutation.isPending || !form.title || !form.body
          }
        >
          {isSubmitting || sendMutation.isPending ? "Sending..." : "Send"}
        </button>
      </form>
      <div className="space-y-4">
        {notifications.map((notification) => (
          <div key={notification._id} className="border-b pb-3">
            <div className="flex justify-between">
              <h3 className="font-semibold">{notification.title}</h3>
              <span className="text-sm text-gray-500">
                {formatDate(notification.sent_at)}
              </span>
            </div>
            <p className="text-sm mt-1">{notification.body}</p>
            <div className="text-xs text-gray-500 mt-1">
              {notification.type} • {notification.read ? "Read" : "Unread"}
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
export default NotificationPage;
