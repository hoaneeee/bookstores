package model;

public enum EnumNotification {
    UNREAD("Chua doc"),
    READ("Da doc");
    private final String value;

    EnumNotification(String value) {
        this.value = value;
    }
    public String getValue() {
        return value;
    }

    public static EnumNotification fromValue(String value) {
        for (EnumNotification status : EnumNotification.values()) {
            if (status.getValue().equals(value)) {
                return status;
            }
        }
        throw new IllegalArgumentException("Unknown value: " + value);
    }
}
